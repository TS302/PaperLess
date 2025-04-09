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
    
    @State private var password: String = "Passwort1."
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String = ""
    @State private var showPassword: Bool = false
    
    @State private var isRegistred = false
//     Wird aktiviert, wenn Registrierung erfolgreich ist
    
    @State private var navigateToLogin = false

    
    var body: some View {
        
        ZStack {
    
                
            
        
            
            NavigationStack {
                VStack(spacing: 100) {
                    HStack {
                        Image("Wolke1")
                            .resizable()
                            .frame(width: 120, height: 60)
                        
                        Text("Paperless")
                            .foregroundColor(.black)
                            .padding(.leading, -30)
//                            .font(.system(size: 30))
                            .font(.system(size: 30, weight: .heavy))
//                         genaue Dicke steuerbar

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 34)
            
//            NavigationStack {
//                VStack(spacing: 10) {
//                    HStack {
//                        Image("Wolke1")
//                            .resizable()
//                            .frame(width: 120, height: 60)
//                        
//                        Text("Paperless")
//                            .foregroundColor(.black)
//                            .padding(.leading, -30)
//                            .font(.system(size: 17))
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 8)
                    
                    
                    
                    
                    
//                    GeometryReader { geometry in
//                        Text("Konto erstellen")
//                            .foregroundColor(.black)
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .padding(.top, geometry.safeAreaInsets.top + 20)
//                            .padding(.bottom, 40)
//                    }
//                    .frame(height: 100)
//                    .padding(.leading, 80)
//                    .padding(.leading, 50)
                    
                    
                    VStack {
//                         Vorname Eingabe
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Vorname")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            TextField("Max", text: $firstname)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 300, height: 44)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.white)
                                        .stroke(Color.blue, lineWidth: 1))
                                
                        }
                        
//                         Nachname Eingabe
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Nachname")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            TextField("Mustermann", text: $lastname)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 300, height: 44)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 1))
                        }
                        
//                         E-Mail Eingabe
                        VStack(alignment: .leading, spacing: 5) {
                            Text("E-Mail")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            TextField("max.mustermann@", text: $email)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(width: 300, height: 44)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.blue, lineWidth: 1))
                                .onChange(of: email) { newValue in
                                    email = newValue.lowercased()
//                                     E-Mail in Kleinbuchstaben umwandeln
                                }
                        }
                        
//                         Passwort Eingabe
                        VStack(alignment: .leading) {
                            Text("Passwort")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            HStack {
                                if showPassword {
                                    TextField("Passwort", text: $password)
                                } else {
                                    SecureField("Passwort", text: $password)
                                }
                                
                                Button(action: {
                                    showPassword.toggle()
                                }) {
                                    Image(systemName: showPassword ? "eye.slash" : "eye")
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding()
                            .frame(width: 300, height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                            
//                             Passwort bestätigen Eingabe
                            Text("Passwort bestätigen")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            HStack {
                                if showPassword {
                                    TextField("Passwort bestätigen", text: $confirmPassword)
                                } else {
                                    SecureField("Passwort bestätigen", text: $confirmPassword)
                                }
                            }
                            .padding()
                            .frame(width: 300, height: 44)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                        }
                        
                        
//                         Registrierung Button
                        Button("Registrieren") {
                            if validatePassword(password) {
                                if password == confirmPassword {
                                    errorMessage = "Registrierung erfolgreich!"
                                    isRegistred = true // Erfolg! Navigation auslösen
                                } else {
                                    errorMessage = "Passwort stimmt nicht überein!"
                                }
                            } else {
                                errorMessage = "Passwort muss 8 Zeichen enthalten!"
                            }
                        }
//                        .frame(maxWidth: .infinity)
                        .frame(width: 269, height: 18)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)
                        
//                        Apple Button
                        ContinueWithAppleView()
//                            .frame(maxWidth: .infinity)
                            .frame(width: 269, height: 18)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding(.top, 5)

//                        Google Button
                        ContinueWithGoogleView()
//                            .frame(maxWidth: .infinity)
//                            .frame(width: 300, height: 18)
                            .frame(width: 269, height: 18)
                            .font(.system(size: 20))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.top, 5)


//                        Fehlermeldung
                        Text(errorMessage)
                            .foregroundColor(errorMessage.contains("erfolgreich") ? .green : .red)
                        
//                         Navigation zu HomeScreenView
                        NavigationLink(destination: HomeScreenViewT(), isActive: $isRegistred) {
                            EmptyView()
//                             EmptyView zum Auslösen der Navigation
                        }
                        
                        Spacer()
                        
//                         Anmeldung Text
                        HStack {
                            Text("Hast du schon ein Konto?")
                                .foregroundColor(.black)
                                .font(.system(size: 13))
                            
                            Button("Anmelden") {
                                navigateToLogin = true
                            }
                            .foregroundColor(.blue)
                            .font(.system(size: 17))
                        }

//                         NavigationLink zur LoginViewT
                        NavigationLink(destination: LoginViewT(), isActive: $navigateToLogin) {
                            EmptyView()
//                             EmptyView zum Auslösen der Navigation
                        }

                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
        
        func validatePassword(_ password: String) -> Bool {
            let pattern = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$"#
            return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
