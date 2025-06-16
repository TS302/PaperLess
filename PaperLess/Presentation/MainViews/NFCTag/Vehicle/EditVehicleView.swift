//
//  EditVehicleView.swift
//  PaperLess
//
//  Created by Tom Salih on 09.06.25.
//

import SwiftUI

struct EditVehicleView: View {
    @EnvironmentObject var vehicleviewModel: VehicleListViewModel
    @Binding var vehicle: Vehicle

    var body: some View {
        List {
            VehicleForm(vehicle: $vehicle, kmFormatter: Formatters.kmFormatter)
        }
    }
}

#Preview {
    VehicleDetailView(vehicle: .constant(Vehicle(nfcTag: NFCTag(id: UUID(), tagID: "000", name: "VW Golf 7 GTI", status: DeviceStatus.available, icon: ObjectIcon.car.rawValue), brand: "Testmarke", kennzeichen: "TÜ-TS-001", color: CarColor.blue, kilometerstand: 114000, serviceInterval: ServiceInterval.nine, lastMaintenance: Date.now)))
        .environmentObject(VehicleListViewModel())
}
