//
//  ListRowTextField.swift
//  PaperLess
//
//  Created by Tom Salih on 19.04.25.
//

import SwiftUI

struct ListRowTextField: View {
    let label: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(label)
                .font(AppFonts.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.appPrimary)
                .opacity(0.5)
            
            TextField("", text: $text)
                .lineLimit(1)
               
        }
    }
}

#Preview {
    ListRowTextField(label: "Bezeichnung", text: .constant("Test"))
}
