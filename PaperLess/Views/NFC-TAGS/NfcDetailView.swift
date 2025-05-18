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
    
    
    var body: some View {
        
        Form {
            
            NfcTabSection(selectedTab: $selectedTab)
            
            if selectedTab == 0 {
                NfcGeneralInfoSection(NfcDocument: $nfcDocument, editGeneralInfoAction: {
                    print("Allgemeine Informationen bearbeiten gedrückt!!")
                })
            } else if selectedTab == 1 {
                
                NoteSection(notes: $nfcDocument.notes) {
                    addingNote = true
                }
            } else {
                PhotosSection(photosPickerItem: $photosPickerItem, selectedImage: $selectedImage)
            }
            
            Section(header: HStack {
                Text("Management")
                    .modifier(SectionTitle())
                Spacer()
            }){
                Picker("Status auswählen", selection: $nfcDocument.status) {
                    ForEach(DeviceStatus.allCases) { status in
                        Text(status.localizedName).tag(status)
                    }
                }
                Picker("Service-Intervall", selection: $nfcDocument.serviceIntervalMonth) {
                    ForEach(ServiceInterval.allCases) { interval in
                        Text(interval.localizedName)
                            .tag(interval)
                    }
                }
            }
        }
        //.modifier(ListStyleTitleInline(title: nfcDocument.name.isEmpty ? "Neues Gerät" : nfcDocument.name))
        .sheet(isPresented: $addingNote) {
            AddNoteView(notes: $nfcDocument.notes)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text(nfcDocument.status.localizedName)
                    .foregroundStyle(Color.appSecondary)
                    .padding(4)
                    .font(.system(size: 9, weight: .black))
                    .clipShape(Rectangle())
                    .frame(width: 60, alignment: .center)
                    .background(nfcDocument.status.color)
                    .cornerRadius(4)
            }
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
        status: DeviceStatus.available,
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

