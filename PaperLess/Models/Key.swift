//
//  Key.swift
//  PaperLess
//
//  Created by Tom Salih on 04.06.25.
//

import SwiftUI

class Key: NFCTagProtocol {
    let id: UUID = UUID()
    var nfcTag: NFCTag
    
    var keyNumber: String
    
    init(nfcTag: NFCTag,
         keyNumber: String
    ) {
        self.nfcTag = nfcTag
        self.keyNumber = keyNumber
    }
}
