//
//  TabView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var userViewModel: UserViewModel
    
    init(userViewModel: UserViewModel) {
            self.userViewModel = userViewModel
            
            // iOS-native Verhalten beibehalten, nur Farben setzen
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Color.hellblau)

            // scrollEdgeAppearance NICHT setzen = native Verhalten bleibt
            UITabBar.appearance().standardAppearance = appearance
        }
    
    var body: some View {
        TabView {
            HomeView(userViewModel: userViewModel)
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
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Einstellungen")
                }
            
            
        }
        .tint(.dunkelblau)
    }
}
