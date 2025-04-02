//
//  RootView.swift
//  PaperLess
//
//  Created by Tom Salih on 01.04.25.
//

import SwiftUI

struct RootView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    @State private var user: User = User(username: "", password: "")
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            MainTabView(
                loginViewModel: loginViewModel,
                user: $user,
                isLoggedIn: $isLoggedIn
            )
        } else {
            LoginView(
                loginViewModel: loginViewModel,
                user: $user,
                isLoggedIn: $isLoggedIn
            )
        }
    }
}

#Preview {
    RootView()
}
