//
//  ListRowTextField.swift
//  PaperLess
//
//  Created by Tom Salih on 19.04.25.
//

import SwiftUI

struct NFCListRow: View {
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
            
            Text(text)
                .font(AppFonts.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
        }
    }
}

#Preview {
    NFCListRow(label: "Bezeichnung", text: .constant("Test"))
}
