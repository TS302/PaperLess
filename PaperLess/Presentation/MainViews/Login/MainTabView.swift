//
//  TabView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var nfcTagViewModel = NFCTagViewModel()
    
    @Binding var user: User
    
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(nfcTagViewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            DocumentView()
                .tabItem {
                    Image(systemName: "text.document")
                    Text("Dokumente")
                }
            
            NFCTagView()
                .environmentObject(nfcTagViewModel)
                .tabItem {
                    Image(systemName: "airtag.radiowaves.forward")
                    Text("NFC-Tag")
                }
            
            SettingsView(
                user: $user,
                isLoggedIn: $user.isLoggedIn
            )
            .tabItem {
                Image(systemName: "gear")
                Text("Einstellungen")
            }
        }
        .tint(.appPrimary)
    }
}
