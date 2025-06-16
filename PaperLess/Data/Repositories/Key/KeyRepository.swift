//
//  KeyRepository.swift
//  PaperLess
//
//  Created by Tom Salih on 15.06.25.
//

import SwiftUI

class KeyRepository: KeyRepositoryProtocol {
    
    private var keys: [Key] = [
        Key(nfcTag: NFCTag(id: UUID(), tagID: "005", name: "KFZ-Schlüssel", status: DeviceStatus.loaned, icon: ObjectIcon.key.rawValue), keyNumber: "111-A11-2234"),
        Key(nfcTag: NFCTag(id: UUID(), tagID: "006", name: "Briefkastenschlüssel", status: DeviceStatus.available, icon: ObjectIcon.key.rawValue), keyNumber: "AB1-BC11-2234")
    ]
    
    func getAllKeys() -> [Key] {
        return keys
    }
    
    func addKey(key: Key) {
        keys.append(key)
    }
    
    func deleteKey(id: UUID) {
        keys.removeAll { $0.id == id }
    }
    
    func makeEmptyKey() -> Key {
        return Key(
            nfcTag: NFCTag(
                id: UUID(),
                tagID: "",
                name: "",
                status: DeviceStatus.available,
                icon: ObjectIcon.key.rawValue
            ),
            keyNumber: ""
        )
    }
}
