//
//  ContentView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct ContentView: View {
    
   
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var validatePassword = ""
    @State private var showPassword: Bool = false
    @State private var errorMessage: String = ""
    
    
    
    
    
    var body: some View {
        
        HStack {
            Image ("Wolke1")
                .resizable()
                .frame(width: 100, height: 60)
            
            Text("Paperless")
                .foregroundColor(.schwarz)
                .padding(.leading, -30)
                .font(.system(size:17))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, -20)
        
        
        GeometryReader { geometry in
            VStack {
                Text("Konto erstellen")
                    .foregroundColor(.schwarz)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, geometry.safeAreaInsets.top + 20)
                
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Vorname")
                        .font(.caption)
                        .foregroundColor(.grau)
                    
                    
                    TextField("Max", text: $firstname)
                        .foregroundColor(.grau)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blau, lineWidth: 1))
                }
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Nachname")
                        .font(.caption)
                        .foregroundColor(.grau)
                    TextField("Mustermann", text: $lastname)
                        .foregroundColor(.grau)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blau, lineWidth: 1))
                    
                    
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("E-mail")
                        .font(.caption)
                        .foregroundColor(.grau)
                    TextField("max.mustermann@", text: $email)
                        .foregroundColor(.grau)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 300, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blau, lineWidth: 1))
                }
                
                
                
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Passwort")
                        .font(.caption)
                        .foregroundColor(.grau)
                    
                    
                    HStack {
                        
                        SecureField("********", text: $password)
                            .foregroundColor(.grau)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blau, lineWidth: 1))
                        
                        
                    }
                    
                }
                
                
                
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Passwort bestätigen")
                        .font(.caption)
                        .foregroundColor(.grau)
                    
                    
                    SecureField("********", text:
                                    $validatePassword)
                    .foregroundColor(.grau)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 300, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blau, lineWidth: 1))
                }
                
                
                Spacer()
                
                
                
                
                Button("Registrieren") {
                    if PaperLess.validatePassword(password) {
                        if password == validatePassword {
                            errorMessage = "Registrierung erfolgreich!"
                        } else {
                            errorMessage = "Passwörter stimmen nicht überein!"
                        }
                    } else {
                        errorMessage = "Passwort muss mindestens 8 Zeichen enthalten!"
                    }
                }
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
                
                
               
                HStack {
                    Button("Hast du schon ein Konto?") {
                    }
                    .foregroundColor(.schwarz)
                    .font(.system(size:13))
                    
                    Button("Anmelden") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .foregroundColor(.blau)
                    .font(.system(size:17))
                    
                    
                    
                }
                
                
            }
            .padding()
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
