//
//  ContentView.swift
//  SpeedometerSwiftUI
//
//  Created by Maryam Kaveh on 5/2/1403 AP.
//

import SwiftUI

struct ContentView: View {
    @State private var isPressing: Bool = false
    @State var progress: CGFloat = 0.0
    @State var timer: Timer?
    @State var speed: TimeInterval = 0.04
    @State var step: Int = 5
    @State var segments: Int = 100
    @State var startAngle : Double = 135.0
    @State var endAngle: Double = 45.0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 10) {
                speedometerView
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pedal.accelerator.fill")
                        .font(.system(size: 60))
                        .tint(.white)
                    
                })
                .frame(width: 60, height: 90)
                .rotation3DEffect(
                    Angle(degrees: isPressing ? 45.0 : .zero),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .center
                )
                .animation(.easeInOut(duration: 0.4), value: isPressing)
                .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, perform: {}, onPressingChanged: { isPressing in
                    self.isPressing = isPressing
                })
                .padding()
            }
            .preferredColorScheme(.dark)
        }
    }
}
#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

extension ContentView {
    
    var speedometerView: some View {
        TimelineView(.animation(minimumInterval: speed)) { context in
            GaugeView(progress: progress,
                      step: step,
                      animationDuration: speed,
                      segments: segments,
                      startAngle: startAngle,
                      endAngle: endAngle
                    )
                .onChange(of: context.date) { oldValue, newValue in
                    let progress = if isPressing {
                        min(1.0, progress + 0.01)
                    }
                    else {
                        max(0.0, progress - 0.01)
                    }
                    if isPressing { speed = 0.05 } else { speed = 0.15 }
                    withAnimation(.bouncy(duration: speed * 3 )) {
                        self.progress = progress
                    }
                }
            }
    }
}

