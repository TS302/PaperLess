//
//  UserListView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import SwiftUI

struct UserListView: View {
    
    @State private var users: [LocalUser] = []
    
    var body: some View {
        NavigationView {
            List(users, id: \.email) { user in
                VStack(alignment: .leading) {
                    Text(user.firstname + " " + user.lastname)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
            .onAppear {
                // Lade alle Benutzer aus UserDefaults
                loadUsers()
            }
            .navigationTitle("Registrierte Benutzer")
        }
    }
    
    func loadUsers() {
        users = AuthService.shared.loadUsers() // Benutzerdaten laden
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
