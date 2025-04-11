//
//  ConfettiParticle.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 11.04.25.
//

import SwiftUI

struct ConfettiParticle: Identifiable {
    let id = UUID()
    let shape: ConfettiShape
    let color: Color
    let size: CGSize
    var xOffset: CGFloat
    var rotation: Double
    let animationDuration: Double

    static func random(shape: ConfettiShape, in containerSize: CGSize) -> ConfettiParticle {
        ConfettiParticle(
            shape: shape,
            color: Color(
                red: .random(in: 0.5...1),
                green: .random(in: 0.5...1),
                blue: .random(in: 0.5...1)
            ),
            size: CGSize(width: CGFloat.random(in: 10...20), height: CGFloat.random(in: 10...20)),
            xOffset: CGFloat.random(in: -containerSize.width / 2...containerSize.width / 2),
            rotation: Double.random(in: 0...360),
            animationDuration: Double.random(in: 1.5...3)
        )
    }
}




extension Color {
    static func random() -> Color {
        Color(
            red: .random(in: 0.5...1),
            green: .random(in: 0.5...1),
            blue: .random(in: 0.5...1)
        )
    }
}
