//
//  RootView.swift
//  PaperLess
//
//  Created by Tom Salih on 01.04.25.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var vehicleViewModel: VehicleListViewModel
    @EnvironmentObject var toolViewModel: ToolListViewModel
    @EnvironmentObject var keyViewModel: KeyListViewModel
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    @State private var user: User = User(firstname: "", lastname: "", email: "tom", password: "2222", isLoggedIn: true)
    
    var body: some View {
        if user.isLoggedIn {
            MainTabView(
                user: $user
            )
            .environmentObject(loginViewModel)
            .environmentObject(vehicleViewModel)
            .environmentObject(toolViewModel)
            .environmentObject(keyViewModel)
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
