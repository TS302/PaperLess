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
            notes: [
                Note(note: "Filter wurde zuletzt im Dezember 2024 gewechselt.", date: Date()),
            ]
        ),
        NfcDocument(
            title: "Wasserkocher Küche OG",
            manufacturer: "HausTech",
            model: "HT-WK2021",
            serialNumber: "WK-00992341",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: [
                Note(note: "Regelmäßiger Gebrauch, keine Wartung bisher notwendig.", date: Date())
            ]
        ),
        NfcDocument(
            title: "Bohrhammer 800",
            manufacturer: "PowerWerk",
            model: "PW800",
            serialNumber: "PW800-887766",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: [
                Note(note: "Stoßdämpfer defekt – Ersatzteil bestellt.", date: Date())
            ]
        ),
        NfcDocument(
            title: "Kaffeemaschine Büro",
            manufacturer: "CaféTech",
            model: "CT-BAR200",
            serialNumber: "CTB-220987",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: [
                Note(note: "Wurde 2023 entkalkt. Regelmäßige Wartung empfohlen.", date: Date())
            ]
        ),
        NfcDocument(
            title: "Akkuschrauber MaxPower",
            manufacturer: "ProTools",
            model: "XDrive450",
            serialNumber: "XD450-001122",
            purchaseDate: Date(),
            lastServiceDate: Date(),
            notes: [
                Note(note: "Gerät wurde nach 6 Monaten das erste Mal gewartet.", date: Date())
            ]
        )
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach($nfcDocuments) { $nfcDocument in
                    NavigationLink {
                        NfcDetailView(nfcDocument: $nfcDocument)
                    } label: {
                        NfcDocumentRow(nfcDocument: nfcDocument)
                    }
                }
            }
        }
        .navigationTitle("NFC-Dokumente")
        
    }
}

#Preview {
    NfcView()
}
