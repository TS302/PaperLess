//
//  Untitled.swift
//  PaperLess
//
//  Created by Tom Salih on 04.05.25.
//
import SwiftUI


extension View {
    func applyNavigationBarAppearance() -> some View {
        self.onAppear {
            let standard = UINavigationBarAppearance()
            standard.configureWithOpaqueBackground()
            standard.backgroundColor = UIColor.appSecondary
            standard.titleTextAttributes = [.foregroundColor: UIColor.appPrimary]
            standard.largeTitleTextAttributes = [.foregroundColor: UIColor.appPrimary]
            UINavigationBar.appearance().standardAppearance = standard
            UINavigationBar.appearance().compactAppearance = standard

            let scroll = UINavigationBarAppearance()
            scroll.configureWithDefaultBackground()
            scroll.backgroundColor = UIColor.appSecondary.withAlphaComponent(0.9)
            scroll.titleTextAttributes = [.foregroundColor: UIColor.appPrimary]
            scroll.largeTitleTextAttributes = [.foregroundColor: UIColor.appPrimary]
            UINavigationBar.appearance().scrollEdgeAppearance = scroll

            UINavigationBar.appearance().tintColor = UIColor.appPrimary
        }
    }
}
