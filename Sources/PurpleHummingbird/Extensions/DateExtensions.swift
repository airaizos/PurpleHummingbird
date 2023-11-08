//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 1/9/23.
//

import Foundation

public extension Date {
    static let yesterday: Date = {
        if let day = Calendar.current.date(byAdding: .day,value: -1, to: Date.now) {
            return Calendar.current.startOfDay(for: day)
        }
        return Date()
    }()
    
    static let today: Date = {
        Calendar.current.startOfDay(for: .now)
    }()
    
    static let tomorrow: Date = {
        if let day = Calendar.current.date(byAdding: .day,value: 1, to: Date.now) {
            return Calendar.current.startOfDay(for: day)
        }
        return Date()
    }()
    
    static let januaryFirst2020: Date? = {
        var calendario = Calendar.current
        var componentes = calendario.dateComponents([.year, .month], from: Date())
        componentes.day = 1
        componentes.month = 1
        componentes.year = 2020
        componentes.timeZone = .current
        return calendario.date(from: componentes)
    }()
    
    static let firstDayCurrentMonth: Date? = {
        var calendario = Calendar.current
        var componentes = calendario.dateComponents([.year, .month], from: Date())
        componentes.day = 1
        componentes.timeZone = .current
        return calendario.date(from: componentes)
    }()
    
}
