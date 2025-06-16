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
    @Published var newkey: Key
    @Published var filterOption: FilterOption = .all
    
    private let getKeys: LoadKeysUseCase
    private let addKey: AddKeyUseCase
    private let makeEmptyKey: MakeEmptyKeyUseCase
    private let deleteKey: DeleteKeyUseCase
    
    init() {
        let repo = KeyRepository()
        self.getKeys = LoadKeysUseCase(repository: repo)
        self.addKey = AddKeyUseCase(repository: repo)
        self.makeEmptyKey = MakeEmptyKeyUseCase(repository: repo)
        self.deleteKey = DeleteKeyUseCase(repository: repo)
        self.newkey = makeEmptyKey.execute()
        
    }
    
    func loadKeys() {
        keys = getKeys.execute()
    }
    
    func addKey(key: Key) {
        addKey.execute(key: key)
    }
    
    func deleteKey(id: UUID) {
        deleteKey.execute(id: id)
        loadKeys()
    }
    
    func emptyKey() {
        newkey = makeEmptyKey.execute()
    }
    
}
