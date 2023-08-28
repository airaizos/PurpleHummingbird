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

    let urlCategories = Bundle.module.url(forResource: "categories", withExtension: "json")!
    let urlImage = Bundle.module.url(forResource: "100", withExtension: "png")!
    
    override func startLoading() {
        var data: Data?
        
        guard let url = request.url else {
            client?.urlProtocol(self, didFailWithError: PHNetworkError.loadingFromDocuments)
            return }
        
        switch url.lastPathComponent {
            
        case "categories": data = try? Data(contentsOf: urlCategories)
        case "image": data = try? Data(contentsOf: urlImage)
        case "error404": let response = HTTPURLResponse(url: urlCategories, statusCode: 404, httpVersion: nil, headerFields: ["Content/Type":"application/json"])!
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocolDidFinishLoading(self)
            
        case "badResponse": data = nil
            let error = NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil)
            self.client?.urlProtocol(self, didFailWithError: error)
            return
        case "1": data = try? Data(contentsOf: urlCategories)

        default: client?.urlProtocol(self, didFailWithError: PHNetworkError.badData)
            client?.urlProtocolDidFinishLoading(self)
        }
        
            guard let data else {
                client?.urlProtocol(self, didFailWithError: PHNetworkError.badData )
                return }
            
            client?.urlProtocol(self, didLoad: data)
            if let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: ["Content/Type":"application/json"]) {
                
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                
            }
            client?.urlProtocolDidFinishLoading(self)

  
        
       
    }
    
    override func stopLoading() {
        
    }
}
