//
//  LoginViewT.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 08.04.25.
//
import SwiftUI

struct LoginViewT: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
   
    @State private var showPassword: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
               
                    
                    TextFieldInput(label: "E-Mail", text: $email)
                    
                    SecureTextFieldInput(label: "Passwort", text: $password, showPassword: $showPassword, showEyeIcon: true)
                
              
                
                
                
               
                NavigationLink(destination: LoginViewT()) {
                    LoginButtonView()
                }
                .font(.system(size: 17))
                
                
                
                NavigationLink(destination: RegistrationView()) {
                    Text("Zurück zur Registrierung")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .navigationTitle("Login")
            .background(Color.appOnprimary)
        }
    }
}

struct LoginViewT_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewT()
    }
}
