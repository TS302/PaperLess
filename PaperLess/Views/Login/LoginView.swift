//
//  LoginView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @Binding var user: User
    
    @State private var loginError: Bool = false
    @State private var registrationSheetIsPressented: Bool = false
    @State private var showPasswort: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
                Text("PAPERLESS")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundStyle(Color.appPrimary)
                
                Text("Dokumente digitalisieren & verwelten!")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.primary)
                    .opacity(0.8)
                    .padding(.bottom, 60)
            
            
                TextFieldInput(label: "Benutzername", text: $user.email)
                .padding(.bottom, 20)
                SecureTextFieldInput(label: "Passwort", text: $user.password, showPassword: $showPasswort, showEyeIcon: false)
                .padding(.bottom, 20)
            
            if loginError {
                Text("Ungültiger Benutzername oder Passwort!")
                    .foregroundStyle(.appError)
                    .font(.caption)
                    .padding(.bottom,15)
            }
            
            HStack{
                Button("Registrieren") {
                    registrationSheetIsPressented.toggle()
                    user.email = ""
                    user.password = ""
                }
                .sheet(isPresented: $registrationSheetIsPressented) {
                    RegistrationView(showPassword: $showPasswort, user: $user)
                }
                .font(.footnote)
                .foregroundColor(.appPrimary)
                .opacity(0.8)
                
                Spacer()
                
                Button("Login") {
                    if loginViewModel.checkAccessData(email: user.email, password: user.password) {
                        loginError = false
                        user.isLoggedIn = true
                    } else {
                        loginError = true
                    }
                }
                .frame(width: 100, height: 40)
                .background(Color.appPrimary)
                .foregroundStyle(Color.appSecondary)
                .fontWeight(.bold)
                .cornerRadius(6)
                .shadow(color: .gray.opacity(0.6), radius: 4, x: 0, y: 2)
                
            }
            .padding(.horizontal, 40)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appSecondary)
    }
}

#Preview {
    LoginView(
        user: .constant(User(firstname: "", lastname: "", email: "", password: "", isLoggedIn: false))
        
    )
}

