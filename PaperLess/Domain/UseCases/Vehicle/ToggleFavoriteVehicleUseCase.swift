//
//  ToggleFavoriteUseCase.swift
//  PaperLess
//
//  Created by Tom Salih on 18.06.25.
//

import Foundation

struct ToggleFavoriteVehicleUseCase {
    private let repository: VehicleRepositoryProtocol
    init(repository: VehicleRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(id: UUID) {
        repository.toggleFavoriteVehicle(id: id)
    }
}

