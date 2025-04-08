//
//  LoginViewT.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 08.04.25.
//

import SwiftUI

struct LoginViewT: View {
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
            .navigationTitle("Login")
        }
    }
}


struct LoginViewT_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewT()
    }
}

