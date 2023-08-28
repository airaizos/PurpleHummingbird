//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 24/8/23.
//

import UIKit


protocol DataLoadable {
    
    func fetchJSON<JSON:Codable>(url: URL, type: JSON.Type) async throws -> JSON
    func fetchImage(baseURL:URL, path: String) async throws -> UIImage
    func fetchJSON<JSON:Codable>(url: URL, parameter:String?, type: JSON.Type) async throws -> JSON
    
}


