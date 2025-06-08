//
//  NfcView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI

struct NFCTagView: View {
    @StateObject private var viewModel = NFCTagViewModel()
    @StateObject private var vehicleViewModel = VehicleViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ObjectSegmentPicker(selectedSegment: $viewModel.selectedSegment)
                
                switch viewModel.selectedSegment {
                case 0:
                    NFCTagListView(items: $vehicleViewModel.vehicles) { $vehicle in
                        VehicleDetailView(vehicle: $vehicle)
                            .environmentObject(vehicleViewModel)
                    }
                case 1:
                    NFCTagListView(items: $viewModel.tools) { $tool in
                        ToolDetailView(tool: $tool)
                    }
                case 2:
                    NFCTagListView(items: $viewModel.keys) { $key in
                        KeyDetailView(key: $key)
                    }
                default:
                    EmptyView()
                }
            }
            .modifier(ListStyle(title: "NFC-Tags"))
            .searchable(text: $viewModel.searchText, prompt: "Suchen")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    SortMenu(
                        onAlphaSort: { },
                        onStatusSort: { }
                    )
                    AddObjectMenu(
                        showAddVehicle: $vehicleViewModel.showAddVehicle,
                        showAddTool: $viewModel.showAddTool,
                        showAddKey: $viewModel.showAddKey
                    )
                }
            }
            .sheet(isPresented: $vehicleViewModel.showAddVehicle) {
                AddVehicleView()
                    .environmentObject(vehicleViewModel)
                    .presentationDragIndicator(.visible)
            }
        }
        .background(Color.primary)
    }
}

#Preview {
    NFCTagView()
}
