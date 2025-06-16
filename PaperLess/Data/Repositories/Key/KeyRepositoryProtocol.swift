//
//  KeyRepositoryProtocol.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import Foundation

protocol KeyRepositoryProtocol {
    func getAllKeys() -> [Key]
    func addKey(key: Key)
    func makeEmptyKeys() -> Key
    func deleteKey(id: UUID)
}
