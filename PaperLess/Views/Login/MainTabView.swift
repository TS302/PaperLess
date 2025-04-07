//
//  TabView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @Binding var user: User
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView {
            HomeView(
                user: $user,
                isLoggedIn: $isLoggedIn
            )
            .environmentObject(loginViewModel)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            DocumentView()
                .tabItem {
                    Image(systemName: "text.document")
                    Text("Dokumente")
                }
            
            NfcView()
                .tabItem {
                    Image(systemName: "airtag.radiowaves.forward")
                    Text("NFC-Tag")
                }
            
            SettingsView(
                user: $user,
                isLoggedIn: $isLoggedIn
            )
            .tabItem {
                Image(systemName: "gear")
                Text("Einstellungen")
            }
        }
        .tint(.dunkelblau)
    }
}
