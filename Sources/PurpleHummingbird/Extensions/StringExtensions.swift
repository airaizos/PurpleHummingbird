//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 13/4/23.
//

import Foundation

extension String {
    func validateEmail() -> Bool {
        let regexEmail = #"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"#
        
        if #available(iOS 16, *) {
            let regex = try? Regex(regexEmail)
            if let _ = try? regex?.wholeMatch(in:self) {
                return true
            } else {
                return false
            }
        } else {
            /// Resto de versiones iOS15 y menores
            if let range = self.range(of: regexEmail, options: .regularExpression), range.lowerBound == self.startIndex, range.upperBound == self.endIndex {
                return true
            } else {
                return false
            }
        }
    }
}
