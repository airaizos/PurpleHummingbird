import XCTest
@testable import PurpleHummingbird

final class PurpleHummingbirdTests: XCTestCase {
    var network: PHNetwork!
    
    override func setUpWithError() throws {
        network = PHNetwork(urlProtocol: URLSessionMock.self)
    }

    override func tearDownWithError() throws {
      network = nil
    }
    
    
    func testFetchJSON() async throws {
        let baseURL = URL(string: "http://127.0.0.1:8080/categories")!
        let categories = try await network.fetchJSON(url: baseURL, type: [Category].self)
        
        XCTAssertEqual(categories.count, 8)
    }
    
    func testFetchJSONErrorJson() async throws {
        let baseURL = URL(string: "http://127.0.0.1:8080/categories")!
        
        await XCTAssertThrowsErrorAsync(try await network.fetchJSON(url: baseURL, type: [BadCategory].self), PHNetworkError.general)
    }
    
    func testFetchImage() async throws {
        let testURL = URL(string: "http://127.0.0.1:8080/image")!
        let image = try await network.fetchImage(baseURL: testURL, path: "")
        
        XCTAssertNotNil(image)
    }
    
    func testFetchJSONParameter() async throws {
        let testURL = URL(string: "http://127.0.0.1:8080/")!
        
        let categories = try await network.fetchJSON(url: testURL, parameter: "1", type: [Category].self)
        
        XCTAssertEqual(categories.count, 8)
        
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


