//
//  TabView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @EnvironmentObject var vehicleViewModel: VehicleListViewModel
    @EnvironmentObject var toolViewModel: ToolListViewModel
    @EnvironmentObject var keyViewModel: KeyListViewModel
    
    @Binding var user: User
    
    var body: some View {
        TabView {
            HomeView()
            .environmentObject(vehicleViewModel)
            .environmentObject(toolViewModel)
            .environmentObject(keyViewModel)
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
                .environmentObject(vehicleViewModel)
                .environmentObject(toolViewModel)
                .environmentObject(keyViewModel)
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
