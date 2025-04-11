//
//  ConfettiShape.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 11.04.25.
//

import SwiftUI

enum ConfettiShape: Identifiable {
    var id: UUID { UUID() }

    case triangle
    case slimRectangle
    case roundedCross
    case emoji(String)
    case sfSymbol(String)
    case image(Image)

    func view(size: CGSize) -> some View {
        Group {
            switch self {
            case .triangle:
                Path { path in
                    path.move(to: CGPoint(x: size.width / 2, y: 0))
                    path.addLine(to: CGPoint(x: size.width, y: size.height))
                    path.addLine(to: CGPoint(x: 0, y: size.height))
                    path.closeSubpath()
                }
                .frame(width: size.width, height: size.height)

            case .slimRectangle:
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: size.width / 4, height: size.height)

            case .roundedCross:
                VStack(spacing: 2) {
                    Capsule().frame(width: size.width, height: size.height / 5)
                    Capsule().frame(width: size.width, height: size.height / 5)
                }
                .rotationEffect(.degrees(45))

            case .emoji(let symbol):
                Text(symbol).font(.system(size: min(size.width, size.height)))

            case .sfSymbol(let name):
                Image(systemName: name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width, height: size.height)

            case .image(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size.width, height: size.height)
            }
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct RoundedCross: Shape {
    func path(in rect: CGRect) -> Path {
        let barThickness = rect.width * 0.2
        let cornerRadius = barThickness / 2
        var path = Path()

        let vertical = CGRect(x: rect.midX - barThickness / 2, y: rect.minY, width: barThickness, height: rect.height)
        let horizontal = CGRect(x: rect.minX, y: rect.midY - barThickness / 2, width: rect.width, height: barThickness)

        path.addRoundedRect(in: vertical, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        path.addRoundedRect(in: horizontal, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))

        return path
    }
}
