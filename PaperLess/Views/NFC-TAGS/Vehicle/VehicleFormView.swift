//
//  VehicleFormView.swift
//  PaperLess
//
//  Created by Tom Salih on 08.06.25.
//

import SwiftUI

struct VehicleFormView: View {
    @Binding var vehicle: Vehicle
    var kmFormatter: NumberFormatter
    
    var body: some View {
        List {
            
            ///MARK Hier weiter auslagern
            TextField("Fahrzeugbezeichnung", text: $vehicle.nfcTag.name)
                .modifier(TextFieldModi())
            
            TextField("KFZ Kennzeichen", text: $vehicle.kennzeichen)
                .textInputAutocapitalization(.characters)
                .modifier(TextFieldModi())
            
            HStack {
                TextField(
                    "Kilometerstand",
                    value: $vehicle.kilometerstand,
                    formatter: kmFormatter
                )
                .keyboardType(.numberPad)
                .modifier(TextFieldModi())
                
                Spacer()
                
                Text("KM")
                    .modifier(TextFieldModi())
            }
            .listRowBackground(Color.secondary)
            
            HStack {
                TextField("Tag ID", text: $vehicle.nfcTag.tagID)
                    .keyboardType(.numberPad)
                    .modifier(TextFieldModi())
                
                Button {
                    
                } label: {
                    Image(systemName: "widget.small.badge.plus")
                        .foregroundStyle(Color.primary)
                }
            }
            .listRowBackground(Color.secondary)
            
            Picker(selection: $vehicle.nfcTag.status, label:
                    HStack {
                Text("Status")
                    .font(.callout)
                    .fontWeight(.bold)
            }
            ) {
                ForEach(DeviceStatus.allCases) { statusCase in
                    HStack {
                        Text(statusCase.localizedName)
                            .font(.callout)
                        
                    }
                    .tag(statusCase)
                }
            }
            .modifier(ListItem())
            
            Picker(selection: $vehicle.color , label:
                    HStack {
                Text("Fahrzeugfarbe")
                    .font(.callout)
                    .fontWeight(.bold)
            }
            ) {
                ForEach(CarColor.allCases) { statusCase in
                    HStack {
                        Text(statusCase.localizedName)
                            .font(.callout)
                        
                    }
                    .tag(statusCase)
                }
            }
            .modifier(ListItem())
            
            DatePicker(
                selection: $vehicle.lastMaintenance,
                displayedComponents: [.date]
            ) {
                Text("Letzte Inspektion")
                    .modifier(TextFieldModi())
                
            }
            .modifier(ListItem())
            
            Picker(selection: $vehicle.serviceInterval , label:
                    HStack {
                Text("Serviceintervall")
                    .font(.callout)
                    .fontWeight(.bold)
            }
            ) {
                ForEach(ServiceInterval.allCases) { statusCase in
                    HStack {
                        Text(statusCase.localizedName)
                            .font(.callout)
                        
                    }
                    .tag(statusCase)
                }
            }
            .modifier(ListItem())
        }
    }
}
