//
//  File.swift
//  
//
//  Created by Adrian Iraizos Mendoza on 11/4/23.
//

import SwiftUI

struct Points: Shape {
    var points:Int = 5
    var size:CGFloat = 40
    var distance:CGFloat = 5
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / distance
        let angle = .pi * 2 / CGFloat(points * 2)
        
        var path = Path()
        for i in 0..<points*2 {
            let point = CGPoint(x: center.x + radius * cos(CGFloat(i) * angle), y: center.y + radius * sin(CGFloat(i) * angle))
            if i % 2 == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
            if i % 2 == 1 {
                let circlePath = Path(ellipseIn: CGRect(x: point.x - 5, y: point.y - 5, width: size, height: size))
                path.addPath(circlePath)
            }
        }
        path.closeSubpath()
        
        return path
    }
}
