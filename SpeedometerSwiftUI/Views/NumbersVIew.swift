//
//  Numbers.swift
//  SpeedometerSwiftUI
//
//  Created by Maryam Kaveh on 5/6/1403 AP.
//

import SwiftUI

struct NumbersView: View {
    let segments: Int
    let step: Int
    let startAngle: Double
    let endAngle: Double
    
    var segmentToRadian: Double {
        return (Double.pi * 2 * (1 - (startAngle - endAngle) / 360) / Double(segments / (step * 2)))
    }
    
    var body: some View {
        
        ZStack {
            ForEach(0..<(segments / (step * 2)) + 1) { index in
                Text(String(index * step * 2))
                    .foregroundStyle(.white.opacity(0.8))
                    .offset(y: -120)
                    .rotationEffect(.radians(segmentToRadian * Double(index)))
            }
        }
        .rotationEffect(.degrees(-(270 - startAngle)))
    }
}

#Preview {
    NumbersView(segments: 100, step: 5, startAngle: 120, endAngle: 60)
    
}



