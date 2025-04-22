//
//  NfcDocumentRow.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI

struct NfcDocumentRow: View {
    let nfcDocument: NfcDocument
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "airtag.radiowaves.forward.fill")
                .modifier(ListRowIcon())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(nfcDocument.name)
                    .modifier(ListRowTitle())
                
                Text(nfcDocument.notes.first?.note ?? "keine Notizen")
                    .modifier(ListRowSubtitle())
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    let testDocument = NfcDocument(
        name: "Testgerät",
        brand: "Muster Marke",
        model: "Beispielmodell 1.0",
        serialNumber: "1010110",
        purchaseDate: Date(),
        nextServiceDate: Date(),
        notes: [
            Note(note: "Dies ist ein Testgerät für die Vorschau die länger als eine Zeile lang sein sollte.", date: Date())
        ]
    )
    NfcDocumentRow(nfcDocument: testDocument)
}
