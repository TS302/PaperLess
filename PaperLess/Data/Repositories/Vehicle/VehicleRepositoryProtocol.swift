//
//  Untitled.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import Foundation

protocol VehicleRepositoryProtocol {
    func getAllVehicles() -> [Vehicle]
    func getAllFavoriteVehicles() -> [Vehicle]
    func addVehicle(newVehicle: Vehicle)
    func makeEmptyVehicle() -> Vehicle
    func deleteVehicle(id: UUID)
    func updateVehicle(vehicle: Vehicle)
    func toggleFavoriteVehicle(vehicle: Vehicle)
}
