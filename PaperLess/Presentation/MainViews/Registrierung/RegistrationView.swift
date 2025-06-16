//
//  ContentView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct RegistrationView: View {
    
    
    /*
    //    Textfelder
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password: String = ""
     */
    
    @State private var passwordConfirmation: String = ""
    
    //     Zustand für die Sichtbarkeit des Passwortes
    @Binding var showPassword: Bool
    @Binding var user: User
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Spacer()
                
                VStack {
                    Text("PAPERLESS")
                        .fontWeight(.black)
                        .font(.largeTitle)
                        .foregroundStyle(Color.appPrimary)
                        .padding(.top, 30)
                    
                    Text("Dokumente digitalisieren & verwelten!")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.primary)
                        .opacity(0.8)
                        .padding(.bottom, 30)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("Vorname")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 55)
                    TextFieldInput(label: "Vorname", text: $user.firstname)
                    
                    Text("Nachname")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 55)
                    TextFieldInput(label: "Nachname", text: $user.lastname)
                    
                    Text("E-Mail")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 55)
                    TextFieldInput(label: "E-Mail", text: $user.email)
                    
                    Text("Passwort")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 55)
                    SecureTextFieldInput(label: "********", text: $user.password, showPassword: $showPassword, showEyeIcon: true)
                    
                    Text("Passwort bestätigen")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 55)
                    SecureTextFieldInput(label: "********", text: $passwordConfirmation, showPassword: $showPassword, showEyeIcon: false)
                    
                    Spacer()
                    
                    NavigationLink(destination: HomeView(user: $user, isLoggedIn: $user.isLoggedIn)) {
                        RegisterButtonView()
                    }
                    
                    NavigationLink(destination: HomeView(user: $user, isLoggedIn: $user.isLoggedIn)) {
                        AppleRegisterButtonView()
                    }
                    .padding(.leading, 7)
                    NavigationLink(destination: HomeView(user: $user, isLoggedIn: $user.isLoggedIn)) {
                        GoogleRegisterButtonView()
                    }
                    .padding(.leading, 7)
                }
                
                HStack {
                    
                    Text("Hast du schon ein Konto?")
                        .foregroundColor(.black)
                        .font(.system(size: 13))
                    
                    NavigationLink(destination: LoginView(user: $user)) {
                        LoginButtonView()
                    }
                    .foregroundColor(.blue)
                    .font(.system(size: 17))
                }
            }
            .background(Color.appSecondary)
        }
    }
}


#Preview {
    RegistrationView(
        showPassword: .constant(false),
        user: .constant(User(firstname: "", lastname: "", email: "", password: "", isLoggedIn: false))
    )
}
/*
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(showPassword: .constant(false), user: User(firstname: "", lastname: "", email: "", password: "", isLoggedIn: false))
    }
}
*/

