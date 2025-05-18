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
            Image(systemName: "widget.small")
                .modifier(ListRowIcon())
            
            VStack(alignment: .leading) {
                Text(nfcDocument.name)
                    .font(.caption)
                    .fontWeight(.semibold)
                Text(nfcDocument.notes.first?.note ?? "keine Notizen")
                    .font(.caption2)
                    .lineLimit(2)
            }
            Spacer()
            VStack {
                Text(nfcDocument.status.localizedName)
                    .foregroundStyle(Color.appSecondary)
                    .padding(4)
                    .font(.system(size: 9, weight: .black))
                    .clipShape(Rectangle())
                    .frame(width: 60, alignment: .center)
                    .background(nfcDocument.status.color)
                    .cornerRadius(4)
                Text(nfcDocument.category?.localizedName ?? "unbekannt")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
            }
        }
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
