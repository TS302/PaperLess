//
//  AddKeyUseCase.swift
//  PaperLess
//
//  Created by Tom Salih on 16.06.25.
//

import Foundation

struct AddKeyUseCase {
    private var repository: KeyRepositoryProtocol
    init(repository: KeyRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(key: Key) {
        repository.addKey(key: key)
    }
}
