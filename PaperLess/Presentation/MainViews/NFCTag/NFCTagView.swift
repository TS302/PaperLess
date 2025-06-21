//
//  NfcView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI

struct NFCTagView: View {
    
    @StateObject private var nfcTagViewModel = NFCTagViewModel()
    @StateObject private var vehicleViewModel = VehicleListViewModel()
    @StateObject private var toolViewModel = ToolListViewModel()
    @StateObject private var keyViewModel = KeyListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                SegmentPicker(selectedSegment: $nfcTagViewModel.selectedSegment, segmentCount: 3, label1: "Fahrzeuge", label2: "Tools", label3: "Schlüssel")
                
                switch nfcTagViewModel.selectedSegment {
                    
                case 0:
                    NFCTagListView(items: $vehicleViewModel.vehicles) { $vehicle in
                        VehicleDetailView(vehicle: $vehicle)
                            .environmentObject(vehicleViewModel)
                    } onDelete: { vehicle in
                        vehicleViewModel.deleteVehicle(id: vehicle.id)
                    }
                    
                case 1:
                    NFCTagListView(items: $toolViewModel.tools) { $tool in
                        ToolDetailView(tool: $tool)
                            .environmentObject(toolViewModel)
                    } onDelete: { tool in
                        toolViewModel.deleteTool(id: tool.id)
                    }
                    
                case 2:
                    NFCTagListView(items: $keyViewModel.keys) { $key in
                        KeyDetailView(key: $key)
                            .environmentObject(keyViewModel)
                    } onDelete: { key in
                        keyViewModel.deleteKey(id: key.id)
                    }
                    
                default:
                    EmptyView()
                }
            }
            .onAppear {
                vehicleViewModel.loadVehicles()
                toolViewModel.loadTools()
                keyViewModel.loadKeys()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    SortMenu(
                        onAlphaSort: { },
                        onStatusSort: { }
                    )
                    AddObjectMenu(
                        showAddVehicle: $nfcTagViewModel.showAddVehicle,
                        showAddTool: $nfcTagViewModel.showAddTool,
                        showAddKey: $nfcTagViewModel.showAddKey
                    )
                }
            }
            .sheet(isPresented: $nfcTagViewModel.showAddVehicle) {
                AddVehicleView()
                    .environmentObject(vehicleViewModel)               
            }
            .searchable(text: $nfcTagViewModel.searchText, prompt: "Suchen")
            .modifier(ListStyle(title: "NFC-Tags"))
        }
        .background(Color.primary)
    }
}

#Preview {
    NFCTagView()
}
