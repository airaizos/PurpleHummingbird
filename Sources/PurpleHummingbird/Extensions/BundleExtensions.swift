//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 10/4/23.
//

import Foundation

public extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw JsonError.location
        }

        guard let data = try? Data(contentsOf: url) else {
            throw JsonError.load
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            throw JsonError.decode
        }
        return loaded
    }
}

public enum JsonError:Error {
    case location, load, decode
}
