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
        
        await XCTAssertThrowsErrorAsync(try await network.fetchJSON(url: baseURL, type: [BadCategory].self), PHNetworkError.badJson(JsonError.decode))
    }
    
    func testFetchJSONErrorStatus() async throws {
        let baseURL = URL(string: "http://127.0.0.1:8080/error404")!
     
        await XCTAssertThrowsErrorAsync(try await network.fetchJSON(url: baseURL, type: [Category].self), PHNetworkError.status(404))
    }
    
    func testFetchImage() async throws {
        let testURL = URL(string: "http://127.0.0.1:8080/image")!
        let image = try await network.fetchImage(baseURL: testURL, path: "")
        
        XCTAssertNotNil(image)
    }
}


