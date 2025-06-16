//
//  MakeEmptyVehicle.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import Foundation

struct MakeEmptyVehicleUseCase {
    private let repo: VehicleRepository
    init(repo: VehicleRepository) {
        self.repo = repo
    }
    func execute() -> Vehicle {
        return repo.makeEmptyVehicle()
    }
}
