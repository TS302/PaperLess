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
        User(username: "AngelaMerkel", password: "3333"),
        User(username: "ElonMusk", password: "3333"),
        User(username: "BarackObama", password: "3333"),
        User(username: "TaylorSwift", password: "3333"),
        User(username: "CristianoRonaldo", password: "3333"),
        User(username: "JenniferLawrence", password: "3333"),
        User(username: "AlbertEinstein", password: "3333"),
        User(username: "OprahWinfrey", password: "3333"),
        User(username: "LeonardoDiCaprio", password: "3333"),
        User(username: "EmmaWatson", password: "3333"),
        User(username: "MarkZuckerberg", password: "3333"),
        User(username: "BillGates", password: "3333"),
        User(username: "RihannaFenty", password: "3333"),
        User(username: "TomHanks", password: "3333"),
        User(username: "GretaThunberg", password: "3333"),
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
        return userArray.contains { $0.username == username && $0.password == password }
    }
}



