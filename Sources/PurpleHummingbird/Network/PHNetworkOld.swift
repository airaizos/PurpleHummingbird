//
//  PFNetwork.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 2/4/23.
//

import UIKit

public final class PHNetworkOld {
    public static let shared = PHNetworkOld()
    
    let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    
    public func fetchJson<JSON:Decodable>(url: URL, type:JSON.Type) async throws -> JSON {
        do {
            let (data,response) =  try await URLSession.shared.data(from: url)
            
            guard let res = response as? HTTPURLResponse else { throw NetError.noResponse }
            switch res.statusCode == 200 {
            case true:
                do {
                    return try JSONDecoder().decode(JSON.self, from:data)
                } catch {
                    throw NetError.jsonError(error.localizedDescription)
                }
            case false: throw NetError.status(res.statusCode)
            }
        } catch let error as NetError {
            throw error
        } catch {
            throw NetError.general(error.localizedDescription)
        }
    }
    
    public func fetchImage(url: URL) async throws -> UIImage {
        let (data,_) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else { throw NetError.data }
        
        return image
    }
    
    public func fetchFile(url: URL) async throws {
        
        var destinationUrl:URL
        
        if #available(iOS 16.0, *) {
            destinationUrl = documentURL.appending(path: url.lastPathComponent)
            if FileManager().fileExists(atPath: destinationUrl.path()) {
                throw NetError.fileExists("File already exists \(destinationUrl.path())")
                
            } else {
                destinationUrl = documentURL.appendingPathComponent(url.lastPathComponent)
                if FileManager().fileExists(atPath: destinationUrl.path) {
                    throw NetError.fileExists("File already exists \(destinationUrl.path)")
                }
            }
        }
        
        URLSession.shared.downloadTask(with: url) { tempURL, response, error in
            guard let tempURL, let res = response as? HTTPURLResponse else { return  }
            if res.statusCode == 200 {
                try? FileManager.default.moveItem(at: tempURL, to: self.documentURL)
            }
        }.resume()
         
    }
    
    public enum NetError: Error {
        case noResponse,jsonError(String),status(Int),general(String)
        case url, data, fileExists(String), saving
    }
    
    public enum HTTPMethods:String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
