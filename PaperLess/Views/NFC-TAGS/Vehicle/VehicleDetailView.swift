//
//  VehicleDetailView.swift
//  PaperLess
//
//  Created by Tom Salih on 04.06.25.
//

import SwiftUI

struct VehicleDetailView: View {
    @EnvironmentObject var vehicleviewModel: VehicleViewModel
    
    @Binding var vehicle: Vehicle
    var body: some View {
            Text("\(vehicle.nfcTag.name)")
    }
}

#Preview {
    VehicleDetailView(vehicle: .constant(Vehicle(nfcTag: NFCTag(id: UUID(), tagID: "000", name: "Test Auto", status: DeviceStatus.available, icon: ObjectIcon.car.rawValue), brand: "Testmarke", kennzeichen: "TÜ-TEST-001", color: CarColor.blue, kilometerstand: 11111, serviceInterval: ServiceInterval.nine, lastMaintenance: Date.now)))
}
