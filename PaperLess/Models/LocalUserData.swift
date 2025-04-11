//
//  LocalUser.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import Foundation

struct LocalUserData: Codable {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
}
