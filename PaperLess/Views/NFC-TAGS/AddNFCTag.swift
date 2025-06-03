//
//  AddNFCTag.swift
//  PaperLess
//
//  Created by Tom Salih on 24.05.25.
//

import SwiftUI

struct AddNFCTag: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var nfcDocuments: [NfcDocument]
    @State var newNfcDocument = NfcDocument(name: "", brand: "", model: "")
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: HStack{
                    Text("Allgemeine Informationen")
                        .modifier(SectionTitle())
                    Spacer()
                }){
                    NFCTextField(label: "Bezeichnung", text: $newNfcDocument.name)
                    NFCTextField(label: "Marke", text: $newNfcDocument.brand)
                    NFCTextField(label: "Model", text: $newNfcDocument.model)
                    NFCTextField(label: "Seriennummer", text: $newNfcDocument.serialNumber.replacingNil(or: ""))
                    Picker("Typ", selection: $newNfcDocument.category) {
                        Text("Keine").tag(String?.none)
                        ForEach(Category.allCases) { category in
                            Text(category.localizedName).tag(Optional(category))
                                .tag(category)
                        }
                    }
                }
                Section(header: HStack {
                    Text("Management")
                        .modifier(SectionTitle())
                    Spacer()
                }){
                    Picker("Status auswählen", selection: $newNfcDocument.status) {
                        ForEach(DeviceStatus.allCases) { status in
                            Text(status.localizedName).tag(status)
                        }
                    }
                    Picker("Service-Intervall", selection: $newNfcDocument.serviceIntervalMonth) {
                        ForEach(ServiceInterval.allCases) { interval in
                            Text(interval.localizedName)
                                .tag(interval)
                        }
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
                        addNfcDocument(nfcDocuments: nfcDocuments, newNfcDocument: newNfcDocument)
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
    
    
    func addNfcDocument(nfcDocuments: [NfcDocument], newNfcDocument: NfcDocument) {
        self.nfcDocuments.append(newNfcDocument)
    }
}

#Preview {
    let nfcDocuments: [NfcDocument] = []
    AddNFCTag(nfcDocuments: .constant(nfcDocuments))
}
