//
//  AuthService.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    private let usersKey = "users"
    
//     Benutzer registrieren
    func registerUser(user: LocalUserData, completion: @escaping (Result<Void, Error>) -> Void) {
        var users = loadUsers()
        
//         E-Mail-Überprüfung
        if users.contains(where: { $0.email.lowercased() == user.email.lowercased() }) {
            completion(.failure(NSError(domain: "AuthService", code: 1, userInfo: [NSLocalizedDescriptionKey: "E-Mail ist bereits registriert."])))
            return
        }
        
        users.append(user)
        saveUsers(users: users)
        completion(.success(()))
    }
    
//     Alle Benutzer laden
    func loadUsers() -> [LocalUserData] {
        if let savedData = userDefaults.data(forKey: usersKey),
           let decodedUsers = try? JSONDecoder().decode([LocalUserData].self, from: savedData) {
            return decodedUsers
        }
        return []
    }
    
//     Benutzer speichern – jetzt öffentlich, damit auch von außen gespeichert werden kann (z. B. nach dem Löschen)
    func saveUsers(users: [LocalUserData]) {
        if let encodedData = try? JSONEncoder().encode(users) {
            userDefaults.set(encodedData, forKey: usersKey)
        }
    }
}

