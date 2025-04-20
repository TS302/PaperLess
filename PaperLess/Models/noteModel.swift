//
//  noteModel.swift
//  PaperLess
//
//  Created by Tom Salih on 19.04.25.
//

import Foundation

struct Note: Identifiable {
    let id: UUID = UUID()
    var note: String
    var date: Date
    
    
    static let sampleData: [Note] = [
        Note(note: "Gerät mit NFC‑Sticker erfolgreich registriert und in der App angelegt.", date: Date()),
        Note(note: "Batteriestatus prüfen: 85 % Restkapazität laut Sensor.", date: Date()),
        Note(note: "Letzte Nutzung: 18.04.2025 um 16:30 Uhr – Daten synchronisiert.", date: Date())
    ]
}
