//
//  EditVehicleView.swift
//  PaperLess
//
//  Created by Tom Salih on 09.06.25.
//

import SwiftUI

struct EditVehicleView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vehicleViewModel: VehicleListViewModel
    @Binding var vehicle: Vehicle

    var body: some View {
        VStack {
            List {
                VehicleForm(vehicle: $vehicle, kmFormatter: Formatters.kmFormatter)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondary)
        
        Button {
            vehicleViewModel.updateVehicle(vehicle: vehicle)
            dismiss()
        } label: {
            Text("Speichern")
                .font(.callout)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.secondary)
                .padding(10)
                .background(Color.primary)
                .cornerRadius(6)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
        }
        
    }
}

#Preview {
    VehicleDetailView(vehicle: .constant(Vehicle(nfcTag: NFCTag(id: UUID(), tagID: "000", name: "VW Golf 7 GTI", status: DeviceStatus.available, icon: ObjectIcon.car.rawValue), brand: "Testmarke", kennzeichen: "TÜ-TS-001", color: CarColor.blue, kilometerstand: 114000, serviceInterval: ServiceInterval.nine, lastMaintenance: Date.now)))
        .environmentObject(VehicleListViewModel())
}
