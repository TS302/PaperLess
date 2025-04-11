//
//  ConfettiView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 11.04.25.
//

import SwiftUI

struct ConfettiView: View {
    let shapes: [ConfettiShape]
    let numberOfParticles: Int
    let size: CGSize

    @State private var particles: [ConfettiParticle] = []

    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                particle.shape.view(size: particle.size)
                    .foregroundStyle(particle.color)
                    .rotationEffect(.degrees(particle.rotation))
                    .offset(x: particle.xOffset, y: -size.height / 2)
                    .onAppear {
                        withAnimation(.easeOut(duration: particle.animationDuration)) {
                            if let index = particles.firstIndex(where: { $0.id == particle.id }) {
                                particles[index].xOffset += CGFloat.random(in: -40...40)
                            }
                        }
                    }
            }
        }
        .frame(width: size.width, height: size.height)
        .clipped()
        .onAppear {
            generateParticles()
        }
    }

    private func generateParticles() {
        particles = (0..<numberOfParticles).map { _ in
            let shape = shapes.randomElement() ?? .triangle
            return ConfettiParticle.random(shape: shape, in: size)
        }
    }
}

struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiView(
            shapes: [
                .triangle,
                .slimRectangle,
                .roundedCross,
                .emoji("🎉"),
                .sfSymbol("heart.fill"),
                .image(Image(systemName: "star.fill"))
            ],
            numberOfParticles: 40,
            size: CGSize(width: 300, height: 400)
        )
        .background(Color.black.opacity(0.1))
    }
}

