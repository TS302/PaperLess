//
//  RegistrationView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import Foundation

struct LocalUser: Codable {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
}

class AuthService {
    
    static let shared = AuthService()
    private let userDefaultsKey = "registeredUsers"
    
    private init() {}

    func registerUser(user: LocalUser, completion: @escaping (Result<Void, Error>) -> Void) {
        var users = loadUsers()
        
        // Prüfen, ob E-Mail schon existiert
        if users.contains(where: { $0.email.lowercased() == user.email.lowercased() }) {
            completion(.failure(NSError(domain: "AuthService", code: 1, userInfo: [NSLocalizedDescriptionKey: "E-Mail ist bereits registriert."])))
            return
        }

        users.append(user)
        if saveUsers(users) {
            completion(.success(()))
        } else {
            completion(.failure(NSError(domain: "AuthService", code: 2, userInfo: [NSLocalizedDescriptionKey: "Benutzer konnte nicht gespeichert werden."])))
        }
    }

    func loadUsers() -> [LocalUser] {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else { return [] }
        let users = try? JSONDecoder().decode([LocalUser].self, from: data)
        return users ?? []
    }

    private func saveUsers(_ users: [LocalUser]) -> Bool {
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
            return true
        }
        return false
    }
}
