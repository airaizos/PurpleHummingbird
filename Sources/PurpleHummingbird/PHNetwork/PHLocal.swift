//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 25/8/23.
//

import UIKit
public final class PHLocal: DataLoadable {
    
    
    public func fetchJSON<JSON>(url: URL, type: JSON.Type) async throws -> JSON where JSON : Decodable, JSON : Encodable {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw PHNetworkError.loadingFromBundle
        }
    }
    
    public func fetchImage(baseURL: URL, path: String) async throws -> UIImage {
        do {
            let data = try Data(contentsOf: baseURL.appending(path: path))
            guard let image = UIImage(data: data) else { throw PHNetworkError.badImage }
            return image
            
        } catch {
            throw PHNetworkError.loadingFromBundle
        }
    }
    
    public func fetchJSON<JSON:Codable>(url: URL, parameter: String? = nil, type: JSON.Type) async throws -> JSON {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw PHNetworkError.loadingFromBundle
        }
    }
}
