//
//  Tool.swift
//  PaperLess
//
//  Created by Tom Salih on 04.06.25.
//

import SwiftUI

class Tool: NFCTagProtocol {
    let id: UUID = UUID()
    var nfcTag: NFCTag
    
    var brand: String
    var toolType: ToolType
    
    init(nfcTag: NFCTag,
         brand: String,
         toolType: ToolType
    ) {
        self.nfcTag = nfcTag
        self.brand = brand
        self.toolType = toolType
    }
}
