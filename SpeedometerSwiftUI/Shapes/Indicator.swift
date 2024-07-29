//
//  Indicator.swift
//  SpeedometerSwiftUI
//
//  Created by Maryam Kaveh on 5/6/1403 AP.
//

import SwiftUI

struct Indicator: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: CGRect(origin: CGPoint(x: rect.origin.x, y: rect.origin.y - 45), size: CGSize(width: rect.width, height: rect.height / 1.8)), cornerSize: CGSize(width: 55,height: 55))
        return path
    }
}

#Preview {
    Indicator()
        .frame(width: 4, height: 100)
}
