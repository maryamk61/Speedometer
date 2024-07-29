//
//  Tick.swift
//  SpeedometerSwiftUI
//
//  Created by Maryam Kaveh on 5/6/1403 AP.
//

import SwiftUI

struct Tick: Shape {
    let isStep: Bool
    let isLong: Bool
   
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: isLong ? rect.minY + 25 : (isStep ? rect.minY + 18 : 10)))
        return path
    }
}

struct Ticks: View {
    let segments: Int
    let step: Int
    let startAngle: Double
    let endAngle: Double
    
    var segmentToRadian: Double {
        return (Double.pi * 2 * (1 - (startAngle - endAngle) / 360) / Double(segments))
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<segments + 1) { index in
                Tick(isStep: index.isMultiple(of: step) , isLong: index.isMultiple(of: step * 2))
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.white.opacity(0.55))
                    .rotationEffect(.radians(segmentToRadian) * Double(index))
            }
        }
        .rotationEffect(.degrees(-(270 - startAngle)))
    }
}

#Preview {
    Ticks(segments: 50, step: 5, startAngle: 120.0, endAngle: 60.0)
        .frame(width: 200, height: 200)
}

