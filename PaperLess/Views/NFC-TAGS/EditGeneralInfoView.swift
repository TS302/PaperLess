//
//  EditGeneralInfoView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.05.25.
//

import SwiftUI

struct EditGeneralInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var nfcDocument: NfcDocument
    
    var body: some View {
        NavigationStack {
            
            List {
                NFCTextField(label: "Bezeichnung", text: $nfcDocument.name)
                NFCTextField(label: "Marke", text: $nfcDocument.brand)
                NFCTextField(label: "Model", text: $nfcDocument.model)
                NFCTextField(label: "Seriennummer", text: $nfcDocument.serialNumber.replacingNil(or: "1111-2222-3333-4444"))
                Picker("Typ", selection: $nfcDocument.category) {
                    Text("Keine").tag(String?.none)
                    ForEach(Category.allCases) { category in
                        Text(category.localizedName).tag(Optional(category))
                            .tag(category)
                    }
                }
                .padding(.vertical, 5)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.square.fill")
                            .foregroundStyle(Color.appError)
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Speichern")
                            .frame(maxWidth: .infinity)
                            
                            .font(.caption)
                            .foregroundStyle(Color.appSecondary)
                            .padding(8)
                            .background(Color.appPrimary)
                            .cornerRadius(6)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.appSecondary)
        }
    }
}

#Preview {
    EditGeneralInfoView(nfcDocument: .constant(
        NfcDocument(
            name: "Bohrmaschine",
            brand: "Bosch",
            model: "A-1123142",
            serialNumber: "2222-1111-55555-66666",
            purchaseDate: Date(),
            nextServiceDate: Date()
        )
    ))
}
