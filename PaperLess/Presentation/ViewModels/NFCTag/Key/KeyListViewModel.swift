//
//  KeyListViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import Foundation
import Combine

class KeyListViewModel: ObservableObject {
    
    @Published var showAddKey = false
    @Published var searchText: String = ""
    @Published var showEditKey = false
    @Published var selectedSegment = 0
    @Published var keys: [Key] = []
    @Published var newkey: Key? = nil
    @Published var filterOption: FilterOption = .all
    
    private let getKeys: LoadKeysUseCase
    private let deleteKey: DeleteKeyUseCase
    
    init() {
        let repo = KeyRepository()
        self.getKeys = LoadKeysUseCase(repository: repo)
        self.deleteKey = DeleteKeyUseCase(repository: repo)
    }
    
    func loadKeys() {
        keys = getKeys.execute()
    }
    
    func deleteKey(id: UUID) {
        deleteKey.execute(id: id)
        loadKeys()
    }
}
