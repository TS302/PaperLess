//
//  StandardButton.swift
//  PaperLess
//
//  Created by Tom Salih on 08.06.25.
//

import SwiftUI

struct StandardButton: View {
    let label: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("\(label)")
                .font(.callout)
                .fontWeight(.bold)
                .frame(width: 120)
                .foregroundStyle(Color.secondary)
                .padding(10)
                .background(color)
                .cornerRadius(6)
        }
    }
}

