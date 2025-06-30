//
//  HomeView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var nfcTagViewModel: NFCTagViewModel
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    
                    switch homeViewModel.selectedSegment {
                    case 0:
                        switch homeViewModel.selectedFavoriteNFCTagSegment {
                            
                        case 0:
                            
                            ForEach(nfcTagViewModel.vehicles.indices.filter {
                                nfcTagViewModel.vehicles[$0].isFavorite
                                }, id: \.self
                            ) { idx in
                              NavigationLink {
                                VehicleDetailView(vehicle: $nfcTagViewModel.vehicles[idx])
                              } label: {
                                VehicleListRow(vehicle: $nfcTagViewModel.vehicles[idx])
                              }
                              .listRowBackground(Color.secondary)
                            }
                            
                        case 1:
                            
                            ForEach(homeViewModel.tools.indices.filter{
                                homeViewModel.tools[$0].isFavorite
                            }, id: \.self
                            ) { idx in
                                NavigationLink {
                                    ToolDetailView(tool: $homeViewModel.tools[idx])
                                } label: {
                                    ToolListRow(tool: $homeViewModel.tools[idx])
                                }
                                .listRowBackground(Color.secondary)
                            }
                            
                        case 2:
                            ForEach(homeViewModel.keys.indices.filter{
                                homeViewModel.keys[$0].isFavorite
                            }, id: \.self
                            ) { idx in
                                NavigationLink {
                                    KeyDetailView(key: $homeViewModel.keys[idx])
                                } label: {
                                    KeyListRow(key: $homeViewModel.keys[idx])
                                }
                                .listRowBackground(Color.secondary)
                            }
                            
                        default:
                            EmptyView()
                        }
                        
                    case 1:
                        ForEach(homeViewModel.documentArray) { document in
                            DocumentRow(document: document)
                                
                        }
                        .listRowBackground(Color.secondary)
                        
                    default:
                        EmptyView()
                    }
                    
                } header: {
                    HStack {
                        DocumentAndNFCTagPicker(selectedSegment: $homeViewModel.selectedSegment)
                        Spacer()
                        if homeViewModel.selectedSegment == 0 {
                            FavoriteNFCTagSegmentPicker(selectedSegment: $homeViewModel.selectedFavoriteNFCTagSegment)
                        }
                    }
                }
            }
            .modifier(ListStyle(title: "Favoriten"))
            .searchable(text: $nfcTagViewModel.searchText, prompt: "Suchen")
        }
    }
}

#Preview {
    HomeView()
}

