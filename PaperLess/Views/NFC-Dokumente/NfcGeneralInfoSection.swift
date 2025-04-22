//
//  NfcGeneralInfoSection.swift
//  PaperLess
//
//  Created by Tom Salih on 21.04.25.
//

import SwiftUI

struct NfcGeneralInfoSection: View {
    
    @Binding var document: NfcDocument
    var editGeneralInfoAction: () -> Void
    
    var body: some View {
        
        Section {
            ListRowTextField(label: "Bezeichnung", text: $document.title)
            
            ListRowTextField(label: "Marke", text: $document.manufacturer)
            
            ListRowTextField(label: "Model", text: $document.model)
            
            ListRowTextField(label: "Seriennummer", text: $document.serialNumber)
        } header: {
            
            HStack {
                Text("Allgemeine Informationen")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.appPrimary)
                Spacer()
                Button(action: editGeneralInfoAction) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.appPrimary)
                }
            }
        }
    }
}


#Preview {
    NavigationView {
        List {
            NfcGeneralInfoSection(
                document: .constant(
                    NfcDocument(
                        title: "Bohrmaschine",
                        manufacturer: "",
                        model: "",
                        serialNumber: "",
                        purchaseDate: Date(),
                        lastServiceDate: Date()
                    )
                ),
                editGeneralInfoAction: {
                    print("Info edit gedrückt.")
                }
            )
        }
    }
}
