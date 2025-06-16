//
//  DocumentModel.swift
//  PaperLess
//
//  Created by Tom Salih on 02.04.25.
//

import Foundation

struct Document: Identifiable, Codable {
    var id: UUID
    var title: String
    var description: String
}
