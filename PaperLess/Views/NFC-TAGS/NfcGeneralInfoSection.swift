//
//  NfcGeneralInfoSection.swift
//  PaperLess
//
//  Created by Tom Salih on 21.04.25.
//

import SwiftUI

struct NfcGeneralInfoSection: View {
    
    @Binding var NfcDocument: NfcDocument
    var editGeneralInfoAction: () -> Void
    
    var body: some View {
        
        Section {
            
            ListRowTextField(label: "Bezeichnung", text: $NfcDocument.name)
            
            ListRowTextField(label: "Marke", text: $NfcDocument.brand)
            
            ListRowTextField(label: "Model", text: $NfcDocument.model)
            
            ListRowTextField(label: "Seriennummer", text: $NfcDocument.serialNumber.replacingNil(or: "1731829"))
            
            Picker("Typ", selection: $NfcDocument.category) {
                Text("Keine").tag(String?.none)
                ForEach(Category.allCases) { category in
                    Text(category.localizedName).tag(Optional(category))
                        .tag(category)
                }
            }
            .padding(.vertical, 5)
        } header: {
            
            HStack {
                Text("Allgemeine Informationen")
                    .modifier(SectionTitle())
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
                NfcDocument: .constant(
                    NfcDocument(
                        name: "Bohrmaschine",
                        brand: "",
                        model: "",
                        serialNumber: "",
                        purchaseDate: Date(),
                        nextServiceDate: Date()
                    )
                ),
                editGeneralInfoAction: {
                    print("Info edit gedrückt.")
                }
            )
        }
    }
}
