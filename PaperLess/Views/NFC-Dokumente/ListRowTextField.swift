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
                .modifier(ListRowSubtitle())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("", text: $text)
                .modifier(ListRowTitle())
        }
    }
}

#Preview {
    let testDocument = NfcDocument(
        title: "Testgerät",
        manufacturer: "Muster Marke",
        model: "Beispielmodell 1.0",
        serialNumber: "1010110",
        purchaseDate: Date(),
        lastServiceDate: Date(),
        notes: [
            Note(note: "Dies ist ein Testgerät für die Vorschau die länger als eine Zeile lang sein sollte.", date: Date())
        ]
    )
    ListRowTextField(label: "Bezeichnung", text: .constant("Test"))
}
