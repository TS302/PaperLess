//
//  HomeScreenView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 07.04.25.
//

import SwiftUI

struct HomeScreenViewT: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack  {
                
                Text("Willkommen auf der Startseite!")
                    .font(.system(size: 25))
                    
                 
                
                NavigationLink(destination: ContentView()) {
                    Text("Zurück zur Registrierung")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Startseite")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.hellblau)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenViewT()
    }
}


