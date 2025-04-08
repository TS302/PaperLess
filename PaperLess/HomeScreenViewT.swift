//
//  HomeScreenView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 07.04.25.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Willkommen auf der Startseite!")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: ContentView()) {
                    Text("Zurück zur Registrierung")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Startseite")
        }
    }
}

struct RegistrationScreenView: View {
    var body: some View {
        Text("Registrierungsbildschirm")
            .font(.largeTitle)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView() // Hier wird nur einmal auf HomeScreenView verwiesen
    }
}

