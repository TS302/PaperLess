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
        


 

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenViewT() 
    }
}

