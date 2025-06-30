//
//  RootView.swift
//  PaperLess
//
//  Created by Tom Salih on 01.04.25.
//

import SwiftUI

struct RootView: View {
    
    @State private var user: User = User(firstname: "", lastname: "", email: "tom", password: "2222", isLoggedIn: true)
    
    var body: some View {
        if user.isLoggedIn {
            MainTabView(
                user: $user
            )
        } else {
            LoginView(
                user: $user
            )
        }
    }
}

#Preview {
    RootView()
}
