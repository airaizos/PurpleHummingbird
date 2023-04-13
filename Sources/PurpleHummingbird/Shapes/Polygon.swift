//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct Polygon: Shape {
    var sides = 5
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // centro y el radio
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = rect.width / 2
        
        // angulo en radianes, 2 pi entre en el numero de lados
        let angle = Double.pi * 2 / Double(sides)
        var startPoint = CGPoint(x: 0, y: 0)
        
        for side in 0 ..< sides {
            let x = center.x + CGFloat(cos(Double(side) * angle)) * CGFloat(radius)
            let y = center.y + CGFloat(sin(Double(side) * angle)) * CGFloat(radius)
            
            let vertexPoint = CGPoint(x: x, y: y)
            if (side == 0) {
                startPoint = vertexPoint
                path.move(to: startPoint)
            } else {
                path.addLine(to: vertexPoint)
            }
            
            //moverse al punto de inicio
            if (side == sides - 1) {
                path.addLine(to: startPoint)
            }
        }
        
        
        return path
        
    }
}
