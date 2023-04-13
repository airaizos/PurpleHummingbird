//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct Star: Shape {
    var points = 5
    var innerRadio: Double = 0.2
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let angle = Double.pi / Double(points)
        
        var startPoint = CGPoint(x: 0, y: 0)
        
        let outerRadius = center.x
        let innerRadius = outerRadius * innerRadio
        
        let maxCorners = 2 * points
        
        for corner in 0 ..< maxCorners {
            
            // punto exterior o interior
            let radius = (corner % 2) == 0 ? outerRadius : innerRadius
            
            let x = center.x + CGFloat(cos(Double(corner) * angle)) * CGFloat(radius)
            let y = center.y + CGFloat(sin(Double(corner) * angle)) * CGFloat(radius)
            let point = CGPoint(x: x, y: y)
            
            if (corner == 0) {
                startPoint = point
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
            //Finaliza y termina en el punto de inicio
            if (corner == (maxCorners - 1)) {
                path.addLine(to: startPoint)
            }
        }
        
        
        return path
    }
}
