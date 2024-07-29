//
//  ArcShapeView.swift
//  SpeedometerSwiftUI
//
//  Created by Maryam Kaveh on 5/6/1403 AP.
//

import SwiftUI

struct ArcShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2.0
        
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        return path
    }
}


#Preview {
    ArcShape(startAngle: .degrees(126), endAngle: .degrees(54), clockwise: false)
}
