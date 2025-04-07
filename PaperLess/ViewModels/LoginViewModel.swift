//
//  UserViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import Foundation

class LoginViewModel: ObservableObject {
        
    @Published var userArray: [User] = [
        User(username: "Oguzhan", password: "1111"),
        User(username: "Tom", password: "2222"),
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
    func checkAccessData(username: String, password: String) -> Bool {
        return userArray.contains { user in
            user.username == username && user.password == password
        }
    }
}



