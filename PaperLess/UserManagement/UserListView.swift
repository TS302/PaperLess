//
//  UserListView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//
import SwiftUI

struct UserListView: View {
    
    @State private var users: [LocalUserData] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.email) { user in
                    VStack(alignment: .leading) {
                        Text(user.firstname + " " + user.lastname)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: deleteUser)
            }
            .onAppear {
                loadUsers()
            }
            .navigationTitle("Registrierte Benutzer")
        }
    }
    
    func loadUsers() {
        users = AuthService.shared.loadUsers()
    }
    
    func deleteUser(at offsets: IndexSet) {
        // Entferne Benutzer aus dem Array
        users.remove(atOffsets: offsets)
        
//         Speicher aktualisiertes Array wieder in UserDefaults
        AuthService.shared.saveUsers(users: users)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}


