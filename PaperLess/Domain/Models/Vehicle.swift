//
//  Vehicle.swift
//  PaperLess
//
//  Created by Tom Salih on 03.06.25.
//

import Foundation
import SwiftUI

struct Vehicle: NFCTagProtocol {
    let id: UUID = UUID()
    var nfcTag: NFCTag
    
    var brand: String
    var kennzeichen: String
    var color: CarColor
    var kilometerstand: Int
    var serviceInterval: ServiceInterval
    var lastMaintenance: Date
    
    init(nfcTag: NFCTag,
         brand: String,
         kennzeichen: String,
         color: CarColor,
         kilometerstand: Int,
         serviceInterval: ServiceInterval,
         lastMaintenance: Date
    ) {
        self.nfcTag = nfcTag
        self.brand = brand
        self.kennzeichen = kennzeichen
        self.color = color
        self.kilometerstand = kilometerstand
        self.serviceInterval = serviceInterval
        self.lastMaintenance = lastMaintenance
    }
}
