//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 22/8/23.
//

import UIKit


public final class PHNetwork {
    
    var urlProtocol: URLProtocol.Type?
    
    var session: URLSession {
        if let urlProtocol {
            let configuration = URLSessionConfiguration.ephemeral
            configuration.protocolClasses = [urlProtocol]
            return URLSession(configuration: configuration)
        } else {
            return URLSession.shared
        }
    }
    
    init(urlProtocol: URLProtocol.Type? = nil) {
        self.urlProtocol = urlProtocol
    }
    
    
    func fetchJSON<JSON:Codable>(url: URL, type: JSON.Type) async throws -> JSON {
        do {
            let (data, response) = try await session.data(from: url)
            guard let res = response as? HTTPURLResponse else  {  throw PHNetworkError.badResponse }
            switch res.statusCode == 200 {
            case true:
                do {
                    return try JSONDecoder().decode(JSON.self, from: data)
                } catch let error {
                    throw PHNetworkError.badJson(error)
                }
            case false: throw PHNetworkError.loadingFromCoreData
            }
            
        } catch {
            throw PHNetworkError.badResponse
        }
    }
    
    func fetchImage(baseURL:URL, path: String) async throws -> UIImage {
        do {
            let (data, _) = try await session.data(from: baseURL.appending(path:path))
            guard let image = UIImage(data: data) else { throw PHNetworkError.badImage }
            return image
        } catch {
            throw PHNetworkError.badImage
        }
    }
    
    
    
}
