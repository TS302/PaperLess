//
//  SectionTitle.swift
//  PaperLess
//
//  Created by Tom Salih on 23.04.25.
//

import SwiftUI

struct SectionTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color.appPrimary)
            .opacity(0.5)
    }
}
