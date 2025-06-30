//
//  HomeViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 18.06.25.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {

    @Published var searchText: String = ""
    @Published var selectedSegment = 0
    @Published var selectedFavoriteNFCTagSegment = 0
    @Published var showAddVehicle = false
    @Published var showAddTool = false
    @Published var showAddKey = false
    
    @Published var showEditVehicle = false
    @Published var showEditTool = false
    @Published var showEditKey = false
    @Published var vehicles: [Vehicle] = []
    @Published var tools: [Tool] = []
    @Published var keys: [Key] = []
   
    @Published var documentArray: [Document] = [
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
    
    private let getVehicles: LoadVehiclesUseCase
    private let updateVehicle: UpdateVehicleUseCase
    private let deleteVehicle: DeleteVehicleUseCase
    
    private let getTools: LoadToolsUseCase
    private let updateTool: UpdateToolUseCase
    
    private let getKeys: LoadKeysUseCase
    private let updateKey: UpdateKeyUseCase
    private let deleteKey: DeleteKeyUseCase
    
    init() {
        let vehicleRepository = VehicleRepository.shared
        let toolRepository = ToolRepository.shared
        let keyRepository = KeyRepository.shared
        
        self.getVehicles = LoadVehiclesUseCase(repo: vehicleRepository)
        self.updateVehicle = UpdateVehicleUseCase(repository: vehicleRepository)
        self.deleteVehicle = DeleteVehicleUseCase(repo: vehicleRepository)
        
        self.getTools = LoadToolsUseCase(repository: toolRepository)
        self.updateTool = UpdateToolUseCase(repository: toolRepository)
        
        self.getKeys = LoadKeysUseCase(repository: keyRepository)
        self.updateKey = UpdateKeyUseCase(repository: keyRepository)
        self.deleteKey = DeleteKeyUseCase(repository: keyRepository)
        
        loadVehicles()
        loadTools()
        loadKeys()
    }
    
    func loadVehicles() {
        vehicles = getVehicles.execute()
    }
    
    func updateVehicle(vehicle: Vehicle) {
        updateVehicle.execute(vehicle: vehicle)
        loadVehicles()
    }
    
    func deleteVehicle(id: UUID) {
        deleteVehicle.execute(id: id)
        loadVehicles()
    }
    
    
    func loadTools() {
        tools = getTools.execute()
    }
    
    func updateTool(tool: Tool) {
        updateTool.execute(tool: tool)
        loadTools()
    }
    
    
    func loadKeys() {
        keys = getKeys.execute()
    }
    
    func updateKey(key: Key) {
        updateKey.execute(key: key)
        loadKeys()
    }
    
    func deleteKey(id: UUID) {
        deleteKey.execute(id: id)
        loadKeys()
    }

}
