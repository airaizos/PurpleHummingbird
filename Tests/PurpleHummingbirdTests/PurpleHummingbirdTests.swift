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
        
        XCTAssertEqual(categories.count, 2)
        
        
    }
    
    
}

struct Category: Codable {
    let id: Int
    let name: String
    
    
}
