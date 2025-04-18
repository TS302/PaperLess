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
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Allgemeine Informationen")) {
                    
                    TextField("Titel", text: $nfcDocument.title)
                        .modifier(ListRowTitle())
                    
                    TextField("Marke", text: $nfcDocument.manufacturer)
                        .modifier(ListRowTitle())
                    
                    TextField("Model", text: $nfcDocument.model)
                        .modifier(ListRowTitle())
                    
                    TextField("Seriennummer", text: $nfcDocument.serialNumber)
                        .modifier(ListRowTitle())
                    
                    DatePicker("Erstelldatum", selection: $nfcDocument.purchaseDate, displayedComponents: [.date])
                        .modifier(ListRowTitle())
                        .accentColor(Color.appPrimary)
                    
                    DatePicker("Letztes Servicedatum", selection: $nfcDocument.lastServiceDate, displayedComponents: [.date])
                        .modifier(ListRowTitle())
                        .accentColor(Color.appPrimary)
                }
                
                Section(
                    header: HStack {
                        Text("Bilder")
                            .modifier(ListRowTitle())
                        Spacer()
                        Button(action: {
                            showImagePicker.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        
                        
                    }) {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                        } else {
                            HStack{
                                Text("Kein Bild ausgewählt")
                                    .modifier(ListRowTitle())
                                
                                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                                    Text("Bild auswählen!")
                                }
                                .onChange(of: selectedItem) { oldItem, newItem in
                                    
                                    Task {
                                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                            let uiImage = UIImage(data: data)
                                            selectedImage = uiImage
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                
                Section(header: Text("Notizen")) {
                    TextField("Notiz", text: $nfcDocument.notes)
                        .font(AppFonts.body)
                        .foregroundStyle(Color.appPrimary)
                }
            }
        }
        .navigationTitle("\(nfcDocument.title)")
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
    NfcDetailView(nfcDocument: .constant(testDocument))
}
