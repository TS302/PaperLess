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
    @State private var photosPickerItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker = false
    @State private var addingNote = false
    @State private var selectedTab = 0
    @State private var editGeneralInfo = false
    /*
    private var notesBinding: Binding<[Note]> {
        
        Binding<[Note]>(
            get: { nfcDocument.notes },
            set: { newValue in nfcDocument.notes = newValue }
        )
    }
     */
    
    var body: some View {
        
            List {
                NfcTabSection(selectedTab: $selectedTab)
                
                if selectedTab == 0 {
                    NfcGeneralInfoSection(document: $nfcDocument, editGeneralInfoAction: {
                        print("Allgemeine Informationen bearbeiten gedrückt!!")
                    })
                } else if selectedTab == 1 {
                    
                    NoteSection(notes: $nfcDocument.notes) {
                        addingNote = true
                    }
                } else {
                    PhotosSection(photosPickerItem: $photosPickerItem, selectedImage: $selectedImage)
                }
            }
            .modifier(ListStyleTitleInline(title: nfcDocument.name))
            .sheet(isPresented: $addingNote) {
                AddNoteView(notes: $nfcDocument.notes)
            }
    }
}

#Preview {
    
    let testDocument = NfcDocument(
        name: "BOSCH GX-2001 Schlagbohrmaschine",
        brand: "Bosch",
        model: "Beispielmodell 1.0",
        serialNumber: "1010110-A21-300300300-XYZ",
        purchaseDate: Date(),
        nextServiceDate: Date(),
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

