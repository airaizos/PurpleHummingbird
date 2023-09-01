//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 1/9/23.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    
    func ifChangesSave() throws {
        if self.hasChanges {
            try self.save()
        }
    }
    
}
