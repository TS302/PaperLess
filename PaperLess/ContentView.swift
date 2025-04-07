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
                        
                        @State private var password: String = ""
                        @State private var confirmPassword: String = ""
                        @State private var errorMessage: String = ""
                        @State private var showPassword: Bool = false
                        
                        var body: some View {
                            VStack(spacing: 20) {
                                HStack {
                                    Image("Wolke1")
                                        .resizable()
                                        .frame(width: 100, height: 60)
                                    
                                    Text("Paperless")
                                        .foregroundColor(.schwarz)
                                        .padding(.leading, -30)
                                        .font(.system(size: 17))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                
                                GeometryReader { geometry in
                                    VStack {
                                        Text("Konto erstellen")
                                            .foregroundColor(.schwarz)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .padding(.top, geometry.safeAreaInsets.top + 20)
                                        
                                        Spacer().frame(height: 80)
                                        
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
                                        
                                        VStack(alignment: .leading) {
                                            Text("Passwort")
                                                .font(.caption)
                                                .foregroundColor(.grau)
                                            
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
                                                        .foregroundColor(.grau)
                                                }
                                            }
                                            .padding()
                                            .frame(width: 300, height: 44)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.blau, lineWidth: 1)
                                            )
                                            
                                            Text("Passwort bestätigen")
                                                .font(.caption)
                                                .foregroundColor(.grau)
                                            
                                            HStack {
                                                if showPassword {
                                                    TextField("Passwort bestätigen", text: $confirmPassword)
                                                } else {
                                                    SecureField("Passwort bestätigen", text: $confirmPassword)
                                                }
                                                
                                                Button(action: {
                                                    showPassword.toggle()
                                                }) {
                                                    
                                                }
                                            }
                                            .padding()
                                            .frame(width: 300, height: 44)
                                            .background(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.blau, lineWidth: 1)
                                            )
                                            
                                            Spacer()
                                            
                                            VStack {
                                                Button("Registrieren") {
                                                    if validatePassword(password) {
                                                        if password == confirmPassword {
                                                            errorMessage = "Registrierung erfolgreich!"
                                                        } else {
                                                            errorMessage = "Passwort stimmt nicht überein!"
                                                        }
                                                    } else {
                                                        errorMessage = "Passwort muss 8 Zeichen enthalten!"
                                                    }
                                                }
                                                .font(.system(size: 20))
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color.blau)
                                                .cornerRadius(10)
                                                
                                                Text(errorMessage)
                                                    .foregroundColor(errorMessage.contains("erfolgreich") ? .green : .red)
                                                
                                            }
                                            
                                            HStack {
                                                Text("Hast du schon ein Konto?")
                                                    .foregroundColor(.schwarz)
                                                    .font(.system(size: 13))
                                                
                                                Button("Anmelden") {
                                                }
                                                .foregroundColor(.blau)
                                                .font(.system(size: 17))
                                            }
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
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
