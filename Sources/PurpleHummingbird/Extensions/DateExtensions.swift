//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 1/9/23.
//

import Foundation

public extension Date {
    static let yesterday: Date = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let day = Calendar.current.date(byAdding: .day,value: -1, to: Date.now) {
            return day
        }
        return Date()
    }()
    
    static let today: Date = {
           let df = DateFormatter()
           df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            
           let now = df.string(from: .now)
        
           let dateString = now
           if let date = df.date(from: dateString) {
               return date
           } else {
               return Date()
           }
    }()
    
  
    
    static let tomorrow: Date = {
        let df = DateFormatter()
        if let next = Calendar.current.date(byAdding: .day,value: 1, to: Date.now) {
            return next
        }
        return Date()
    }()
    
}
