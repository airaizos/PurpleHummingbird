//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct Rhomboid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.75, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.closeSubpath()
        return path
    }
}


