//
//  VehicleDetailCard.swift
//  PaperLess
//
//  Created by Tom Salih on 07.06.25.
//

import SwiftUI

struct VehicleDetailCard: View {
    let vehicle: Vehicle
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: vehicle.nfcTag.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.primary)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("\(vehicle.nfcTag.name)")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                
                Text("\(vehicle.kennzeichen)")
                    .modifier(ListRowTitle())
                
                Text("\(vehicle.kilometerstand) KM")
                    .modifier(ListRowTitle())
            }
            
            Spacer()
            
            VStack(spacing: 14) {
                Text(vehicle.nfcTag.status.localizedName)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(6)
                    .frame(width: 80)
                    .background(Color(vehicle.nfcTag.status.color))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                
                HStack(spacing: 4) {
                    Text("Farbe")
                        .modifier(ListRowTitle())
                    
                    Spacer()
                    
                    Image(systemName: "smallcircle.filled.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(vehicle.color.color))
                }
            }
            .frame(width: 80, alignment: .topTrailing)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1),
                        radius: 2,
                        x: 2,
                        y: 2)
        )
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

#Preview {
    VehicleDetailCard(vehicle: Vehicle(nfcTag: NFCTag(id: UUID(), tagID: "001", name: "Testfahrzeug", status: DeviceStatus.available, icon: ObjectIcon.car.rawValue), brand: "Testmarken", kennzeichen: "TÜ-TS-1001", color: CarColor.blue, kilometerstand: 10000, serviceInterval: ServiceInterval.nine, lastMaintenance: Date.now))
}
