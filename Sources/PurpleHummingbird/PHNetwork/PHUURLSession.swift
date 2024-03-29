//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 25/8/23.
//

import UIKit

public final class PHURLSession: DataLoadable {
    
   // static let shared = PHURLSession()
    //MARK: - Para Tests
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
    
    public func fetchJSON<JSON:Codable>(url: URL, type: JSON.Type) async throws -> JSON {
        let (data, response) = try await session.data(from: url)
        guard let res = response as? HTTPURLResponse else  { throw PHNetworkError.noResponse }
        switch res.statusCode == 200 {
        case true:
            do {
                return try JSONDecoder().decode(JSON.self, from: data)
            } catch let error {
                throw PHNetworkError.badJson(error)
            }
        case false: throw PHNetworkError.status(res.statusCode)
        }
    }
    
    public func fetchImage(baseURL:URL, path: String) async throws -> UIImage {
        do {
            let (data, _) = try await session.data(from: baseURL.appending(path:path))
            guard let image = UIImage(data: data) else { throw PHNetworkError.badImage }
            return image
        } catch {
            throw PHNetworkError.badImage
        }
    }
    
    public func fetchValue<T:Decodable>(url: URL, type: T.Type) async throws -> T? {
        let (data,response) = try await session.data(from: url)
        guard let res = response as? HTTPURLResponse else  { throw PHNetworkError.noResponse }
        switch res.statusCode == 200 {
        case true: let value = try? JSONDecoder().decode(type, from: data)
            return value
        case false: throw PHNetworkError.noResults
        }
    }
    
    public func fetchJSON<JSON:Codable>(url: URL, parameter:String? = nil, type: JSON.Type) async throws -> JSON {
        let urlP = url.appending(path: parameter ?? "")
        let (data, response) = try await session.data(from: urlP)
        guard let res = response as? HTTPURLResponse else  { throw PHNetworkError.noResponse }
        switch res.statusCode == 200 {
        case true:
            do {
                return try JSONDecoder().decode(JSON.self, from: data)
            } catch let error {
                throw PHNetworkError.badJson(error)
            }
        case false: throw PHNetworkError.status(res.statusCode)
        }
    }
}

