//
//  UserModel.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    var username: String
    var password: String
}

