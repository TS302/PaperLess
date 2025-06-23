//
//  PaperLessApp.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

@main
struct PaperLessApp: App {
    @StateObject private var vehicleViewModel = VehicleListViewModel()
    @StateObject private var toolViewModel = ToolListViewModel()
    @StateObject private var keyViewModel = KeyListViewModel()
    
    
    var body: some Scene {
        
        WindowGroup {
            RootView()
                .environmentObject(vehicleViewModel)
                .environmentObject(toolViewModel)
                .environmentObject(keyViewModel)
        }
    }
}

