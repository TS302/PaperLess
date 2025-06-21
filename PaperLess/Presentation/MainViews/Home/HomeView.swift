//
//  HomeView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var nfcTagViewModel = NFCTagViewModel()
    @StateObject private var vehicleViewModel = VehicleListViewModel()
    @StateObject private var toolViewmodel = ToolListViewModel()
    @StateObject private var keyViewModel = KeyListViewModel()
    @StateObject private var homeViewModel = HomeViewModel()
    
    
    @Binding var user: User
    @Binding var isLoggedIn: Bool
    
    @State var showAddDocument: Bool = false
    @State var showAddNFC: Bool = false
    
    var documentArray: [Document] = [
        Document(id: UUID(), title: "Mietvertrag", description: "Mietvertrag von der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Nebenkostenabrechnung", description: "Nebenkostenabrechnung für das Jahr 2024 der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Übergabeprotokoll", description: "Protokoll zur Wohnungsübergabe in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Kündigungsschreiben", description: "Kündigung des Mietverhältnisses für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Mängelliste", description: "Aufstellung von Mängeln in der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Einzugsermächtigung", description: "SEPA-Einzugsermächtigung für die Mietzahlungen der Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Mieterhöhung", description: "Mitteilung zur Mieterhöhung für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Hausordnung", description: "Hausordnung für das Mehrfamilienhaus in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Wohnungsbewerbung", description: "Bewerbungsschreiben für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Betriebs- und Heizkostenabrechnung", description: "Abrechnung der Betriebs- und Heizkosten für die Wohnung in der Musterstraße 121 in Tübingen"),
        Document(id: UUID(), title: "Wohnungsübergabebericht", description: "Bericht zur Übergabe der Wohnung in der Musterstraße 121 in Tübingen"),
        
    ]
    
    var body: some View {
        NavigationStack {
            List {
                
                SegmentPicker(selectedSegment: $homeViewModel.selectedSegment, segmentCount: 2, label1: "NFC-Tags", label2: "Dokumente", label3: "Leer")
                
                switch homeViewModel.selectedSegment {
                case 0:
                    SegmentPicker(selectedSegment: $nfcTagViewModel.selectedSegment, segmentCount: 3, label1: "Fahrzeuge", label2: "Tools", label3: "Schlüssel")
                    
                    switch nfcTagViewModel.selectedSegment {
                    case 0:
                        NFCTagListView(items: $vehicleViewModel.favoriteVehicles) { $vehicle in
                            VehicleDetailView(vehicle: $vehicle)
                                .environmentObject(vehicleViewModel)
                        } onDelete: { vehicle in
                            vehicleViewModel.toggleFavoriteVehicle(vehicle: vehicle)
                        }
                        
                    case 1:
                        NFCTagListView(items: $toolViewmodel.favoriteTools) { $tool in
                            ToolDetailView(tool: $tool)
                                .environmentObject(toolViewmodel)
                        } onDelete: { tool in
                            toolViewmodel.toggleToolFavorite(tool: tool)
                        }
                        
                    case 2:
                        NFCTagListView(items: $keyViewModel.favoriteKeys) { $key in
                            KeyDetailView(key: $key)
                                .environmentObject(keyViewModel)
                        } onDelete: { key in
                            keyViewModel.deleteKey(id: key.id)
                        }
                    default:
                        EmptyView()
                    }
                case 2:
                    ForEach(documentArray) { document in
                        DocumentRow(document: document)
                    }
                    
                default:
                    EmptyView()
                }
            }
            .onAppear {
                vehicleViewModel.loadFavoriteVehicles()
                toolViewmodel.loadFavoriteTools()
                keyViewModel.loadFavoriteKeys()
            }
            .modifier(ListStyle(title: "NFC-Tags"))
            .scrollContentBackground(.hidden)
            .background(Color.appSecondary)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddDocument.toggle()
                    }) {
                        Image(systemName: "document.badge.plus")
                            .foregroundStyle(Color.primary)
                    }
                    
                    Button(action: {
                        showAddNFC.toggle()
                    }) {
                        Image(systemName: "badge.plus.radiowaves.right")
                            .foregroundStyle(Color.appPrimary)
                    }
                }
            }
            .sheet(isPresented: $showAddDocument) {
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
            .sheet(isPresented: $showAddNFC) {
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
    HomeView(
        user: .constant(
            User(firstname: "Max", lastname:  "Mustermann",email: "max@beispiel.de", password: "geheim123", isLoggedIn: true)),isLoggedIn: .constant(true)
    )
}

