//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 9/4/23.
//

import Foundation

public final class PHLocalOld {
    
    static let shared = PHLocal()
    
    public func decodeJSON<JSON:Decodable>(from resource:String, type: JSON.Type) throws -> JSON {
        
        guard let fileBundleURL = Bundle.main.url(forResource: resource, withExtension: "json") else { throw LocalError.badResourceName }
        
        let data = try Data(contentsOf: fileBundleURL)
        return try JSONDecoder().decode(JSON.self, from: data)
    }
}

enum LocalError:Error {
    case badResourceName
    
    var description:String {
        switch self {
        case .badResourceName: return "Error en el nombre del archivo"
        }
        
    }
}
