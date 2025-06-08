//
//  NFCTextField.swift
//  PaperLess
//
//  Created by Tom Salih on 19.05.25.
//

import SwiftUI

struct NFCTextField: View {
    let label: String
    @Binding var text: String
    var body: some View {
        VStack {
            Text(label)
                .font(AppFonts.subtitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 1)
                .foregroundStyle(Color.appPrimary)
                .opacity(0.5)
            
            TextField("", text: $text)
                .font(AppFonts.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
        }
    }
}

#Preview {
    NFCTextField(label: "Bezeichnung", text: .constant("Test"))
}
