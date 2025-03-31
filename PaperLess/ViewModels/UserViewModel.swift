//
//  UserViewModel.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var registrationSheetIsPressented = false
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var loginError: Bool = false
    
    @Published var userArray: [User] = [
        User(username: "Oguzhan", password: "1111"),
        User(username: "Tom", password: "2222"),
        User(username: "Angela Merkel", password: "3333"),
        User(username: "Elon Musk", password: "3333"),
        User(username: "Barack Obama", password: "3333"),
        User(username: "Taylor Swift", password: "3333"),
        User(username: "Cristiano Ronaldo", password: "3333"),
        User(username: "Jennifer Lawrence", password: "3333"),
        User(username: "Albert Einstein", password: "3333"),
        User(username: "Oprah Winfrey", password: "3333"),
        User(username: "Leonardo DiCaprio", password: "3333"),
        User(username: "Emma Watson", password: "3333"),
        User(username: "Mark Zuckerberg", password: "3333"),
        User(username: "Bill Gates", password: "3333"),
        User(username: "Rihanna Fenty", password: "3333"),
        User(username: "Tom Hanks", password: "3333"),
        User(username: "Greta Thunberg", password: "3333"),
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



