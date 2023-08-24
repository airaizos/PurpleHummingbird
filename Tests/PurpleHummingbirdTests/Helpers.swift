//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 24/8/23.
//

import XCTest
@testable import PurpleHummingbird



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
