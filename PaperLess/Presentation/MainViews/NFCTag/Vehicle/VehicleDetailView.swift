//
//  VehicleDetailView.swift
//  PaperLess
//
//  Created by Tom Salih on 04.06.25.
//

import SwiftUI

struct VehicleDetailView: View {
    @EnvironmentObject var vehicleViewModel: VehicleListViewModel
    
    @Binding var vehicle: Vehicle
    
    var body: some View {
        
        NavigationStack {
            List {
                SegmentPicker(selectedSegment: $vehicleViewModel.selectedSegment, segmentCount: 3, label1: "Info", label2: "Inspektion", label3: "Historie")
                
                switch vehicleViewModel.selectedSegment {
                    
                case 0:
                    VehicleDetailInfoView(vehicle: $vehicle)
                        .environmentObject(vehicleViewModel)
                    
                default:
                    EmptyView()
                }
            }
            .modifier(ListStyle(title: vehicle.nfcTag.name))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        vehicleViewModel.showEditVehicle.toggle()
                    } label: {
                        Image(systemName: "slider.horizontal.2.square")
                            .foregroundStyle(Color.primary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "star.fill")
                        .foregroundColor(vehicle.isFavorite ? .yellow : Color.primary.opacity(0.3))
                }
            }
            .sheet(isPresented: $vehicleViewModel.showEditVehicle) {
                EditVehicleView(vehicle: $vehicle)
                    .environmentObject(vehicleViewModel)
            }
        }
    }
}


