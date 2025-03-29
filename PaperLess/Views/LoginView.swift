//
//  LoginView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        
        if userViewModel.isLoggedIn {
            MainTabView(userViewModel: userViewModel)
        } else {
            VStack{
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
                
                TextField("Benutzername", text: $userViewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(Color.dunkelblau)
                    .font(.footnote)
                    .autocapitalization(.none)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                
                SecureField("Passwort", text: $userViewModel.password)
                    .foregroundStyle(Color.dunkelblau)
                    .font(.footnote)
                    .padding(.horizontal, 40)
                    .padding(.bottom,15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if userViewModel.loginError {
                    Text("Ungültiger Benutzername oder Passwort!")
                        .foregroundStyle(.appRed)
                        .font(.caption)
                        .padding(.bottom,15)
                }
                
                HStack{
                    Button("Registrieren") {
                        userViewModel.registrationSheetIsPressented.toggle()
                        userViewModel.username = ""
                        userViewModel.password = ""
                    }
                    .font(.footnote)
                    .foregroundColor(.dunkelblau)
                    .opacity(0.8)
                    
                    Spacer()
                    
                    Button("Login") {
                        if userViewModel.checkAccessData(username: userViewModel.username, password: userViewModel.password) {
                            userViewModel.loginError = false
                            userViewModel.isLoggedIn = true
                        } else {
                            userViewModel.loginError = true
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
}

#Preview {
    LoginView()
}
