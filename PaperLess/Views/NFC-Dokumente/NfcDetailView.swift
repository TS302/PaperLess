//
//  NfcDetailView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI
import PhotosUI

struct NfcDetailView: View {
    
    @Binding var nfcDocument: NfcDocument
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false
    @State private var addingNote = false
    @State private var selectedTab = 0
    
    var body: some View {
        
        VStack {
            List {
                Section(header: Text("Allgemeine Informationen")) {
                    
                    ListRowTextField(label: "Bezeichnung", text: $nfcDocument.title)
                    
                    ListRowTextField(label: "Marke", text: $nfcDocument.manufacturer)
                    
                    ListRowTextField(label: "Model", text: $nfcDocument.model)
                    
                    ListRowTextField(label: "Seriennummer", text: $nfcDocument.serialNumber)
                }
                
                Section {
                    Picker("", selection: $selectedTab) {
                        Text("Notizen").tag(0)
                        Text("Bilder").tag(1)
                        Text("Verleih").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .tint(Color.appError)
                    .padding(.vertical, 8)
                }
                if selectedTab == 0 {
                    
                    NoteSection(notes: $nfcDocument.notes) {
                        addingNote = true
                    }
                   
                } else if selectedTab == 1 {
                    
                    PhotosSection(selectedItem: $selectedItem, selectedImage: $selectedImage)
                    
                } else {
                    Section("Verleih") {
                        Text("Verleih")
                    }
                }
            }
            .sheet(isPresented: $addingNote) {
                AddNoteView(notes: $nfcDocument.notes)
            }
            .navigationTitle(nfcDocument.title)
        }
    }
}

#Preview {
    
    let testDocument = NfcDocument(
        title: "BOSCH GX-2001 Schlagbohrmaschine",
        manufacturer: "Bosch",
        model: "Beispielmodell 1.0",
        serialNumber: "1010110-A21-300300300-XYZ",
        purchaseDate: Date(),
        lastServiceDate: Date(),
        notes: [
            Note(note: "Gerät mit NFC‑Sticker erfolgreich registriert und in der App angelegt.", date: Date()),
            Note(note: "Batteriestatus prüfen: 85 % Restkapazität laut Sensor.", date: Date()),
            Note(note: "Letzte Nutzung: 18.04.2025 um 16:30 Uhr – Daten synchronisiert.", date: Date()),
            Note(note: "Firmware‑Update verfügbar: Version 2.1.0 herunterladen und installieren.", date: Date()),
            Note(note: "NFC‑Lesefehler: Sticker neu positionieren und erneut scannen.", date: Date()),
            Note(note: "Gerät in den Energiesparmodus versetzt – Wake‑Up per NFC möglich.", date: Date()),
            Note(note: "Standort geändert: Gerät jetzt in Lagerhalle B abgelegt.", date: Date()),
            Note(note: "Wartungsintervall fällig in 5 Tagen – Terminplanung empfohlen.", date: Date())
        ]
    )
    NfcDetailView(nfcDocument: .constant(testDocument))
}
 
