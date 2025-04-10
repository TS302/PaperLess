//
//  LocalUser.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import Foundation

struct LocalUserData: Identifiable, Codable {
    var id = UUID() // Eine eindeutige ID für jeden Benutzer
    var firstname: String
    var lastname: String
    var email: String
    var password: String
}
