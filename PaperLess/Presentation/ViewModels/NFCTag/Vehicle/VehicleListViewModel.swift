//
//  VehicleViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 07.06.25.
//

import Foundation
import Combine

class VehicleListViewModel: ObservableObject {
    
    @Published var showAddVehicle = false
    @Published var searchText: String = ""
    @Published var showEditVehicle = false
    @Published var selectedSegment = 0
    @Published var vehicles: [Vehicle] = []
    @Published var vehicle: Vehicle
    @Published var filterOption: FilterOption = .all
    
    private let getVehicles: LoadVehiclesUseCase
    private let addNewVehicle: AddVehicleUseCase
    private let makeEmptyVehicle: MakeEmptyVehicleUseCase
    private let deleteVehicle: DeleteVehicleUseCase
    private let updateVehicle: UpdateVehicleUseCase
    
    init() {
        let repo = VehicleRepository()
        self.getVehicles = LoadVehiclesUseCase(repo: repo)
        self.addNewVehicle = AddVehicleUseCase(repo: repo)
        self.makeEmptyVehicle = MakeEmptyVehicleUseCase(repo: repo)
        self.deleteVehicle = DeleteVehicleUseCase(repo: repo)
        self.updateVehicle = UpdateVehicleUseCase(repository: repo)
        
        self.vehicle = makeEmptyVehicle.execute()
        self.updateVehicle.execute(vehicle: vehicle)
    }
    
    func loadVehicles() {
        vehicles = getVehicles.execute()
    }
    
    func addVehicle(vehicle: Vehicle) {
        addNewVehicle.execute(newVehicle: vehicle)
        loadVehicles()
    }
    
    func updateVehicle(vehicle: Vehicle) {
        updateVehicle.execute(vehicle: vehicle)
        loadVehicles()
    }
    
    func deleteVehicle(id: UUID) {
        deleteVehicle.execute(id: id)
        loadVehicles()
    }
    
    func emptyNewVehicle() {
        vehicle = makeEmptyVehicle.execute()
    }
    
    /// Liefert das formatierte Datum als String
    func formattedDate(_ date: Date) -> String {
        Formatters.dateFormatter.string(from: date)
    }
}
