//
//  HomeView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vehicleViewModel: VehicleListViewModel
    @EnvironmentObject var toolViewModel: ToolListViewModel
    @EnvironmentObject var keyViewModel: KeyListViewModel
    
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var nfcTagViewModel = NFCTagViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                
                SegmentPicker(selectedSegment: $homeViewModel.selectedSegment, segmentCount: 2, label1: "NFC-Tags", label2: "Dokumente", label3: "Leer")
                
                switch homeViewModel.selectedSegment {
                case 0:
                    SegmentPicker(selectedSegment: $nfcTagViewModel.selectedSegment, segmentCount: 3, label1: "Fahrzeuge", label2: "Tools", label3: "Schlüssel")
                    
                    switch nfcTagViewModel.selectedSegment {
                    case 0:
                        NFCTagListView(items: $vehicleViewModel.vehicles, filter: { $0.isFavorite }) { $vehicle in
                            VehicleDetailView(vehicle: $vehicle)
                                .environmentObject(vehicleViewModel)
                        } onDelete: { vehicle in
                            
                        }
                        
                    case 1:
                        NFCTagListView(items: $toolViewModel.tools, filter: { $0.isFavorite }) { $tool in
                            ToolDetailView(tool: $tool)
                                .environmentObject(toolViewModel)
                        } onDelete: { tool in
                            toolViewModel.deleteTool(id: tool.id)
                        }
                        
                    case 2:
                        NFCTagListView(items: $keyViewModel.keys, filter: { $0.isFavorite }) { $key in
                            KeyDetailView(key: $key)
                                .environmentObject(keyViewModel)
                        } onDelete: { key in
                            keyViewModel.deleteKey(id: key.id)
                        }
                    default:
                        EmptyView()
                    }
                case 2:
                    ForEach(homeViewModel.documentArray) { document in
                        DocumentRow(document: document)
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
            .modifier(ListStyle(title: "Favoriten"))
            .scrollContentBackground(.hidden)
            .background(Color.appSecondary)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        homeViewModel.showAddDocument.toggle()
                    }) {
                        Image(systemName: "document.badge.plus")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
            .sheet(isPresented: $homeViewModel.showAddDocument) {
                VStack {
                    Text("Neues Dokument hinzufügen")
                        .foregroundStyle(Color.primary)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.secondary)
            }
            .sheet(isPresented: $homeViewModel.showAddNFC) {
                VStack {
                    Text("Neues NFC hinzufügen")
                        .foregroundStyle(Color.appPrimary)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.appSecondary)
            }
        }
    }
}

#Preview {
    HomeView()
}

