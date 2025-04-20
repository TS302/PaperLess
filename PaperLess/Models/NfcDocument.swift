//
//  NfcDocument.swift
//  PaperLess
//
//  Created by Tom Salih on 18.04.25.
//

import Foundation

struct NfcDocument: Identifiable {
    let id: UUID = UUID()
    var title: String
    var manufacturer: String
    var model: String
    var serialNumber: String
    var purchaseDate: Date
    var lastServiceDate: Date
    var notes: [Note]
}
