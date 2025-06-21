//
//  LoadFavoriteVehiclesUseCase.swift
//  PaperLess
//
//  Created by Tom Salih on 18.06.25.
//

import Foundation

struct LoadFavoriteVehiclesUseCase {
    private let repository: VehicleRepositoryProtocol
    init(repository: VehicleRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() -> [Vehicle] {
        repository.getAllFavoriteVehicles()
    }
}
