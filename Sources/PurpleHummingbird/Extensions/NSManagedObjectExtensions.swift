//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 26/8/23.
//

import Foundation
import CoreData

import Foundation
import CoreData

public extension NSManagedObject {
    static func queryData<T:CVarArg>(field:String, filter:T, type:DataType = .string, context:NSManagedObjectContext) -> Self? {
        guard let entityName = entity().name else { return nil }
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetch.predicate = NSPredicate(format: "%K = \(type.rawValue)", field, filter)
        return try? context.fetch(fetch).first as? Self
    }
    
    static func dataExists<T:CVarArg>(field:String, filter:T, type:DataType = .string, context:NSManagedObjectContext) -> Bool {
        guard let entityName = entity().name else { return false }
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetch.predicate = NSPredicate(format: "%K = \(type.rawValue)", field, filter)
        return (try? context.count(for: fetch)) ?? 0 > 0
    }
    
    static func lastValue(field: String,context: NSManagedObjectContext) -> Self? {
        guard let entityName = entity().name else { return nil }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.sortDescriptors = [NSSortDescriptor(key: "\(field)", ascending: false)]
        return try? context.fetch(request).first as? Self
    }
}

public enum DataType:String {
    case string = "%@"
    case number = "%i"
    case decimal = "%d"
}
