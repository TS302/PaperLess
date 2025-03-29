//
//  UserViewModel.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 29.03.25.
//
import SwiftUI

struct UserViewModel: View {
    
    @State private var password: String = "Passwort1."
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
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
            
            SecureField("Passwort bestätigen", text: $confirmPassword)
                .padding()
                .frame(width: 300, height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blau, lineWidth: 1)
                )
            
            Button("Registrieren") {
                if validatePassword(password) {
                    if password == confirmPassword {
                        errorMessage = "Registrierung erfolgreich!"
                    } else {
                        errorMessage = "Passwort stimmt nicht überein!"
                    }
                } else {
                    errorMessage = "Passwort muss 8 Zeichen enthalten!"
                    
//                    errorMessage = "Passwort muss 8 Zeichen, \n einen Großbuchstaben,eine \n und ein Sonderzeichen enthalten!"
                    
                }
            }
            
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(Color.blau)
            .cornerRadius(10)
            
            Text(errorMessage)
                .foregroundColor(errorMessage.contains("erfolgreich") ? .green : .red)
                .padding()
        }
        .padding()
    }
}

func validatePassword(_ password: String) -> Bool {
    let pattern = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$"#
    return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserViewModel()
    }
}
