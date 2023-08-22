//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 22/8/23.
//

import Foundation
import PurpleHummingbird

@testable import PurpleHummingbird
final class URLSessionMock: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
   
    
   
    
   // let dataCategories = categories.data(using: .utf8)
   // let urlCategories = Bundle(for: PurpleHummingbirdTests.self).url(forResource: "categories", withExtension: "json")!
   // let urlImage = Bundle(for:PurpleHummingbirdTests.self).url(forResource: "image", withExtension: "jpeg")!
    
    override func startLoading() {
        var data: Data?
        
        guard let url = request.url else {
            client?.urlProtocol(self, didFailWithError: PHNetworkError.badResponse)
            return }
        
        switch url.lastPathComponent {
            
            //FIXME: - Archivos json que no se cargan del Bundle
        case "categories": data = dataCategories //try? Data(contentsOf: urlCategories
        default: data = dataCategories //try? Data(contentsOf: urlCategories
            
            
        }
        
        guard let data else {
            client?.urlProtocol(self, didFailWithError: PHNetworkError.badResponse )
            return }
        
        client?.urlProtocol(self, didLoad: data)
        if let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: ["Content/Type":"application/json"]) {
            
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
    
    let dataCategories = """
    [
       {
            "id": 1,
            "name": "Aprendizaje"
        },
        {
            "id": 2,
            "name": "Bienestar"
        }
]
""".data(using: .utf8)
}
