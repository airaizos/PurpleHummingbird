//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 1/9/23.
//

import XCTest
import UniformTypeIdentifiers

extension XCTestCase {
    
    func XCTAssertJSONValidator<T:Codable>(url:URL, type: T.Type, file:StaticString = #filePath, line:UInt = #line) async throws {
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            let _ = try JSONDecoder().decode (T.self, from: data)
        } catch {
            var issue = XCTIssue(type: .assertionFailure, compactDescription: "El formato del JSON en la URL \(url.absoluteString) no es el correcto")
            
            issue.associatedError = error
            issue.sourceCodeContext = XCTSourceCodeContext(location: XCTSourceCodeLocation(filePath: file, lineNumber: line))
            issue.attachments = [XCTAttachment(data: data, uniformTypeIdentifier: UTType.json.identifier)]
            record(issue)
        }
    }
    
    
    func XCTAssertThrowsErrorAsync<T, R>(
        _ expression: @autoclosure () async throws -> T,
        _ errorThrown: @autoclosure () -> R,
        _ message: @autoclosure () -> String = "This method should fail",
        file: StaticString = #filePath,
        line: UInt = #line
    ) async where R: Comparable, R: Error  {
        do {
            let _ = try await expression()
            XCTFail(message(), file: file, line: line)
        } catch {
            XCTAssertEqual(error as? R, errorThrown())
        }
    }
}
