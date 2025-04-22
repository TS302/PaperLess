//
//  UserViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import Foundation

class LoginViewModel: ObservableObject {
        
    @Published var userArray: [User] = [
        User(firstname: "Oguzhan", lastname: "Cirpan", email: "cirpan@test.de", password: "1111", isLoggedIn: false),
        User(firstname: "Tom", lastname: "Salih", email: "tom", password: "2222", isLoggedIn: false),
    ]
    
    
    
    /// Überprüft, ob der übergebene Benutzername in Kombination mit dem Passwort im `userArray` vorhanden ist.
    ///
    /// Diese Funktion durchsucht das `userArray` nach einem Benutzer, dessen `username` und `password`
    /// mit den übergebenen Parametern übereinstimmen.
    ///
    /// - Parameters:
    ///   - username: Der Benutzername, der geprüft werden soll.
    ///   - password: Das zum Benutzernamen gehörige Passwort.
    /// - Returns: `true`, wenn ein Benutzer mit diesen Zugangsdaten existiert, sonst `false`.
    func checkAccessData(email: String, password: String) -> Bool {
        return userArray.contains { user in
            user.email == email && user.password == password
        }
    }
}



