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
    @State private var errorMessage: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showPassword: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                VStack(alignment: .center, spacing: 20) {
                    // E-Mail-Feld
                    TextFieldInput(label: "E-Mail", text: $email)
                        .autocapitalization(.none)
                        .onChange(of: email) { newValue in
                            email = newValue.lowercased() // Hier schließen wir den onChange Modifier korrekt ab
                        }
                    
                    // Passwort-Feld mit Möglichkeit zum Sichtbarmachen des Passworts
                    SecureTextFieldInput(label: "Passwort", text: $password, showPassword: $showPassword, showEyeIcon: true)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
                
                Spacer()
                
                // Anmelden Button
                Button("Anmelden") {
                    let users = AuthService.shared.loadUsers()
                    
                    if let user = users.first(where: { $0.email.lowercased() == email.lowercased() }) {
                        if user.password == password {
                            errorMessage = "Anmeldung erfolgreich!"
                            isLoggedIn = true
                        } else {
                            errorMessage = "Falsches Passwort!"
                        }
                    } else {
                        errorMessage = "Benutzer nicht gefunden!"
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal, 40)

                // Fehlernachricht oder Erfolgsmeldung
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(errorMessage == "Anmeldung erfolgreich!" ? .green : .red) // Erfolg in grün, Fehler in rot
                        .padding(.top, 10)
                }

                // NavigationLink zur HomeScreenView
                NavigationLink(destination: HomeScreenViewT(), isActive: $isLoggedIn) {
                    EmptyView()
                }

                // Link zurück zur Registrierung
                NavigationLink(destination: ContentView()) {
                    Text("Zurück zur Registrierung")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .padding()
                }

                Spacer()

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

