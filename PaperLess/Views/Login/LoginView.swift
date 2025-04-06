//
//  LoginView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    @Binding var user: User
    @Binding var isLoggedIn: Bool
    
    @State private var loginError: Bool = false
    @State private var registrationSheetIsPressented: Bool = false
    
    var body: some View {
        VStack {
            
            ///---> Hier  LOGO einfügen.
            Text("PAPERLESS")
                .fontWeight(.black)
                .font(.largeTitle)
                .foregroundStyle(Color.dunkelblau)
            
            Text("Dokumente digitalisieren & verwelten!")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color.dunkelblau)
                .opacity(0.8)
                .padding(.bottom, 60)
            
            
            TextField("Benutzername", text: $user.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.dunkelblau)
                .font(.footnote)
                .autocapitalization(.none)
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
            
            SecureField("Passwort", text: $user.password)
                .foregroundStyle(Color.dunkelblau)
                .font(.footnote)
                .padding(.horizontal, 40)
                .padding(.bottom,15)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if loginError {
                Text("Ungültiger Benutzername oder Passwort!")
                    .foregroundStyle(.appRed)
                    .font(.caption)
                    .padding(.bottom,15)
            }
            
            HStack{
                Button("Registrieren") {
                    registrationSheetIsPressented.toggle()
                    user.username = ""
                    user.password = ""
                }
                .sheet(isPresented: $registrationSheetIsPressented) {
                    RegistrationView()
                }
                .font(.footnote)
                .foregroundColor(.dunkelblau)
                .opacity(0.8)
                
                Spacer()
                
                Button("Login") {
                    if loginViewModel.checkAccessData(username: user.username, password: user.password) {
                        loginError = false
                        isLoggedIn = true
                    } else {
                        loginError = true
                    }
                }
                .frame(width: 100, height: 40)
                .background(Color.dunkelblau)
                .foregroundStyle(Color.hellblau)
                .fontWeight(.bold)
                .cornerRadius(6)
                .shadow(color: .gray.opacity(0.6), radius: 4, x: 0, y: 2)
                
            }
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hellblau)
    }
}

#Preview {
    LoginView(
        loginViewModel: LoginViewModel(),
        user: .constant(User(username: "", password: "")),
        isLoggedIn: .constant(false)
    )
}

