//
//  NfcView.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import SwiftUI

struct NFCTagView: View {
    @EnvironmentObject var nfcTagViewModel: NFCTagViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    switch nfcTagViewModel.selectedSegment {
                        
                    case 0:
                        
                        ForEach($nfcTagViewModel.vehicles) { $vehicles in
                            NavigationLink {
                                VehicleDetailView(vehicle: $vehicles)
                            } label: {
                                VehicleListRow(vehicle: $vehicles)
                            }
                        }
                        .listRowBackground(Color.secondary)
                        
                    case 1:
                        ForEach($nfcTagViewModel.tools) { $tool in
                            NavigationLink {
                                ToolDetailView(tool: $tool)
                            } label: {
                                ToolListRow(tool: $tool)
                            }
                        }
                        .listRowBackground(Color.secondary)
                        
                    case 2:
                        ForEach($nfcTagViewModel.keys) { $key in
                            NavigationLink {
                                KeyDetailView(key: $key)
                            } label: {
                                KeyListRow(key: $key)
                            }
                        }
                        .listRowBackground(Color.secondary)
                        
                    default:
                        EmptyView()
                    }
                } header: {
                    HStack {
                        NFCTagListHeadline(selectedSegment: $nfcTagViewModel.selectedSegment)
                        Spacer()
                        FavoriteNFCTagSegmentPicker(selectedSegment: $nfcTagViewModel.selectedSegment)
                    }
                }
            }
            .onAppear {
                nfcTagViewModel.loadVehicles()
                nfcTagViewModel.loadTools()
                nfcTagViewModel.loadKeys()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    AddObjectMenu(
                        showAddVehicle: $nfcTagViewModel.showAddVehicle,
                        showAddTool: $nfcTagViewModel.showAddTool,
                        showAddKey: $nfcTagViewModel.showAddKey
                    )
                }
            }
            .sheet(isPresented: $nfcTagViewModel.showAddVehicle) {
                AddVehicleView()
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
