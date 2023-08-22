//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 22/8/23.
//

import Foundation


public final class PHNetwork {
    
    
    func fetchJSON<JSON:Codable>(url: URL, type: JSON.Type) async throws -> JSON {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let res = response as? HTTPURLResponse else  {  throw PHNetworkError.badResponse }
            switch res.statusCode == 200 {
            case true:
                do {
                    return try JSONDecoder().decode(JSON.self, from: data)
                } catch let error {
                    throw VaporError.badJson(error)
                }
            case false: throw PHNetworkError.badResponse
            }
            
        } catch {
            throw PHNetworkError.badResponse
        }
        
    }
    
}
