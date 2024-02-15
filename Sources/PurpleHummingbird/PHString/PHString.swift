//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 18/1/24.
//

import Foundation


public final class PHString {
    
    public func obtenerCadena(_ cadena: String, patronInicial desde: String, patronFinal hasta: String) -> String? {
        let patron = "\(desde)(.*?)\(hasta)"
        
        do {
            let regex = try Regex(patron)
            
            if let firstMatch = try regex.firstMatch(in: cadena) {
                let matchRange = firstMatch.range

                return String(cadena[matchRange])
                    .replacingOccurrences(of: desde, with: "")
                    .replacingOccurrences(of: hasta, with: "")
            }
        } catch {
            return nil
        }
        return nil
    }

   
}

