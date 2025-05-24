//
//  NfcGeneralInfoSection.swift
//  PaperLess
//
//  Created by Tom Salih on 21.04.25.
//

import SwiftUI

struct NfcGeneralInfoSection: View {
    
    @Binding var nfcDocument: NfcDocument
    
    var body: some View {
        NFCListRow(label: "Bezeichnung", text: $nfcDocument.name)
        
        NFCListRow(label: "Marke", text: $nfcDocument.brand)
        
        NFCListRow(label: "Model", text: $nfcDocument.model)
        
        NFCListRow(label: "Seriennummer", text: $nfcDocument.serialNumber.replacingNil(or: "1731829"))
        
        NFCListRow(
          label: "Typ",
          text: Binding.constant(
            nfcDocument.category?.localizedName ?? "Nicht verfügbar"
          )
        )
        
        NFCListRow(label: "Status", text: Binding.constant(nfcDocument.status.localizedName))
        NFCListRow(label: "Serviceintervall", text: Binding.constant(nfcDocument.serviceIntervalMonth?.localizedName ?? "Nicht verfügbar"))
    }
}


#Preview {
    NavigationView {
        List {
            NfcGeneralInfoSection(
                nfcDocument: .constant(
                    NfcDocument(
                        name: "Bohrmaschine",
                        brand: "Siemens",
                        model: "A23146",
                        serialNumber: "111-222-333-444",
                        purchaseDate: Date(),
                        nextServiceDate: Date()
                    )
                )
            )
        }
    }
}
