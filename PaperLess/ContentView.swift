//
//  ContentView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct ContentView: View {
    
//    Textfelder
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    @State private var label: String = ""
    
//     Zustand für die Sichtbarkeit des Passwortes
    @State private var showPassword: Bool = false
 
    
  
    
    
    
    
    var body: some View {
        
            NavigationStack {
                
                VStack {
                    HStack {
                        Image("Wolke1")
                            .resizable()
                            .frame(width: 85, height: 85)
                            
                        
                        Text("PAPERLESS")
                            .foregroundColor(.black)
                            .padding()
                            .font(.system(size: 30, weight: .heavy))

                    }
                    .padding(.leading, -85)
                    .padding(.top, -10)
                    Spacer(minLength: 100)

                    
                    
                    
                    
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Vorname")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 55)
                        TextFieldInput(label: "Vorname", text: $firstname)
                        
                        
                        Text("Nachname")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 55)
                        TextFieldInput(label: "Nachname", text: $lastname)
                        
                        
                        Text("E-Mail")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 55)
                        TextFieldInput(label: "E-Mail", text: $email)
                        
                        
                        Text("Passwort")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 55)
                        SecureTextFieldInput(label: "********", text: $password, showPassword: $showPassword, showEyeIcon: true)
                        
                        
                        Text("Passwort bestätigen")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.leading, 55)
                        SecureTextFieldInput(label: "********", text: $passwordConfirmation, showPassword: $showPassword, showEyeIcon: false)
                    }
                    
//                    Abstand zwischen Textfeld und Registrierbutton
                    Spacer(minLength: 40)
                    
                    
                    VStack {
                        
                        NavigationLink(destination: HomeScreenViewT()) {
                            RegisterButtonView()
                        }
                        
                        NavigationLink(destination: HomeScreenViewT()) {
                            AppleRegisterButtonView()
                        }
                        .padding(.leading, 7)
                        NavigationLink(destination: HomeScreenViewT()) {
                            GoogleRegisterButtonView()
                        }
                        .padding(.leading, 7)
                    }
                    
                        
                    
                    
                    
                  
           
                    

                        
                        HStack {
                            
                            Text("Hast du schon ein Konto?")
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                            
                            
                            NavigationLink(destination: LoginViewT()) {
                                LoginButtonView()
                            }
                            .foregroundColor(.blue)
                            .font(.system(size: 17))
                        }
                    }
                    .background(Color.hellblau)
                    
                    
                }
            }
        }
  
    
 
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

