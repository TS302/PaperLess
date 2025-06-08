//
//  AddNFCTag.swift
//  PaperLess
//
//  Created by Tom Salih on 24.05.25.
//

import SwiftUI

struct AddVehicleView: View {
    @EnvironmentObject var vehicleviewModel: VehicleViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    VehicleDetailCard(vehicle: vehicleviewModel.newVehicle)
                    VehicleFormView(vehicle: $vehicleviewModel.newVehicle, kmFormatter: vehicleviewModel.kmFormatter)
                }
                .background(Color.secondary)
            }
            HStack {
                StandardButton(label: "Abbrechen", color: Color.error, action: {
                    vehicleviewModel.emptyNewVehicle()
                    dismiss()
                })
                Spacer()
                StandardButton(label: "Speichern", color: Color.primary, action: {
                    vehicleviewModel.addVehicle()
                    dismiss()
                })
            }
            .padding(.horizontal, 35)
            .padding(.bottom, 20)
            .background(Color.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondary)
    }
}


#Preview {
    AddVehicleView()
        .environmentObject(VehicleViewModel())
}
