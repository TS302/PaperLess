//
//  SettingsView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var user: User
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationView {
            VStack {
                Text("Einstellungen")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondary)
            .navigationBarTitle("Einstellungen")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isLoggedIn = false
                    }) {
                        Image(systemName: "power.circle.fill")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView(user: .constant(User(username: "Max Mustermann", password: "111111")), isLoggedIn: .constant(true))
}
