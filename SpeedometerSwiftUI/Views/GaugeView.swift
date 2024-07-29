//
//  GaugeView.swift
//  SpeedometerSwiftUI
//
//  Created by Maryam Kaveh on 5/6/1403 AP.
//

import SwiftUI

struct GaugeView: View {
    let progress: CGFloat
    let step: Int
    let animationDuration: TimeInterval
    let segments: Int
    let startAngle: Double
    let endAngle: Double
    
    init(progress: CGFloat, step: Int, animationDuration: TimeInterval, segments: Int, startAngle: Double, endAngle: Double) {
        self.progress = progress
        self.step = step //5
        self.animationDuration = animationDuration  //0.04
        self.segments = segments  //100
        self.startAngle = startAngle //135.0
        self.endAngle = endAngle    //45.0
    }
    
    var body: some View {
        ZStack {
            ArcShape(startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees:endAngle), clockwise: false)
                .stroke(.gray.gradient.opacity(0.5) , lineWidth: 10)
            
            ArcShape(startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
                .trim(from: 0.0, to: progress)
                .stroke(AngularGradient(gradient: Gradient(colors: [.green, .yellow, .red]), center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(360)), lineWidth: 10)
            
            ArcShape(startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
                .stroke(.gray.gradient , style: StrokeStyle(lineWidth: 1))
                .frame(width: 310, height: 310)
            
            Ticks(segments: segments, step: step, startAngle: startAngle, endAngle: endAngle)
                .frame(width: 310, height: 310)
                
            VStack(spacing: 3) {
                Text(String(format: "%.f", (progress) * Double(segments)))
                    .font(.system(size: 34))
                    .bold()
                    .foregroundStyle(.white)
                Text("KM/H")
                    .font(.headline)
            }
            .monospaced()
            .foregroundStyle(.white)
            
            Indicator()
                .foregroundStyle(.red)
                .frame(width: 4, height: 100)
                .rotationEffect(.radians((Double.pi * 2 * (1 - (startAngle - endAngle) / 360) ) * progress))
                .rotationEffect(.degrees(-(270 - startAngle)))
            
            NumbersView(segments: segments, step: step, startAngle: startAngle, endAngle: endAngle)
        }
        .frame(width: 330, height: 330)
    }
}


#Preview {
    GaugeView(progress: 0.5, step: 5, animationDuration: 0.04, segments: 100, startAngle: 120.0, endAngle: 60.0)
}
