//
//  RootView.swift
//  PaperLess
//
//  Created by Tom Salih on 01.04.25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    @State private var user: User = User(firstname: "", lastname: "", email: "tom", password: "2222", isLoggedIn: true)
    
    var body: some View {
        if user.isLoggedIn {
            MainTabView(
                user: $user
            )
            .environmentObject(loginViewModel)
        } else {
            LoginView(
                user: $user
            )
            .environmentObject(loginViewModel)
        }
    }
}

#Preview {
    RootView()
}
