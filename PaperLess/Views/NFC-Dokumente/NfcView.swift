//
//  NfcView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI

struct NfcView: View {
    @State private var nfcDocuments: [NfcDocument] = [
        NfcDocument(
            title: "Industriesauger 3000",
            manufacturer: "CleanPro",
            model: "CP3000X",
            serialNumber: "CPX-123456789",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: "Filter wurde zuletzt im Dezember 2024 gewechselt."
        ),
        NfcDocument(
            title: "Wasserkocher Küche OG",
            manufacturer: "HausTech",
            model: "HT-WK2021",
            serialNumber: "WK-00992341",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: "Regelmäßiger Gebrauch, keine Wartung bisher notwendig."
        ),
        NfcDocument(
            title: "Bohrhammer 800",
            manufacturer: "PowerWerk",
            model: "PW800",
            serialNumber: "PW800-887766",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: "Stoßdämpfer defekt – Ersatzteil bestellt."
        ),
        NfcDocument(
            title: "Kaffeemaschine Büro",
            manufacturer: "CaféTech",
            model: "CT-BAR200",
            serialNumber: "CTB-220987",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: "Wurde 2023 entkalkt. Regelmäßige Wartung empfohlen."
        ),
        NfcDocument(
            title: "Akkuschrauber MaxPower",
            manufacturer: "ProTools",
            model: "XDrive450",
            serialNumber: "XD450-001122",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: "Gerät wurde nach 6 Monaten das erste Mal gewartet."
        )
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach($nfcDocuments, id: \.id) { $nfcDocument in
                    NavigationLink(value: nfcDocument) {
                        NfcDocumentRow(nfcDocument: nfcDocument)
                    }
                }
            }
            .navigationDestination(for: NfcDocument.self) { nfcDocument in
                if let index = nfcDocuments.firstIndex(where: {$0.id == nfcDocument.self.id}){
                    NfcDetailView(nfcDocument: $nfcDocuments[index])
                } else {
                    Text("Dokument nicht verfügbar")
                }
            }
        }
        .navigationTitle("NFC-Dokumente")
        
    }
}

#Preview {
    NfcView()
}
