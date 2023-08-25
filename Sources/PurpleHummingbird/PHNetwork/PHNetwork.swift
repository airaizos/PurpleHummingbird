//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 22/8/23.
//

import UIKit


public final class PHNetwork:DataLoadable {
    public static let shared = PHNetwork()
    
    let dataLoader: DataLoadable
    
    
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
  
    init(urlProtocol: URLProtocol.Type? = nil, dataLoader: DataLoadable = PHURLSession()) {
        self.urlProtocol = urlProtocol
        self.dataLoader = dataLoader
    }
    
    public func fetchJSON<JSON:Codable>(url: URL, type: JSON.Type) async throws -> JSON {
        do {
            return try  await dataLoader.fetchJSON(url: url, type: type)
        } catch {
            throw PHNetworkError.general
        }
    }
    
    public func fetchImage(baseURL:URL, path: String) async throws -> UIImage {
        do {
            return try await dataLoader.fetchImage(baseURL: baseURL, path: path)
        } catch {
            throw PHNetworkError.general
        }
    }
}
