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
    
}
