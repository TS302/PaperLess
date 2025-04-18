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
                Text(nfcDocument.title)
                    .modifier(ListRowTitle())
                
                Text(nfcDocument.notes)
                    .modifier(ListRowSubtitle())
            }
        }
        .padding(.vertical, 6)
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
        notes: "Dies ist ein Testgerät für die Vorschau die länger als eine Zeile lang sein sollte."
    )
    NfcDocumentRow(nfcDocument: testDocument)
}
