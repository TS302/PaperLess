//
//  TabView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var nfcTagViewModel = CompanyViewModel()
    
    @Binding var user: User
    
    var body: some View {
        TabView {
            CompanyView()
                .environmentObject(nfcTagViewModel)
                .tabItem {
                    Image(systemName: "house.lodge.fill")
                    Text("Firma")
                }
            
            StaffView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Personal")
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
