//
//  ContentView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

/*
import SwiftUI

struct ContentView: View {
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String = ""
    @State private var showPassword: Bool = false
    @State private var isRegistred = false
    @State private var navigateToLogin = false
    @State private var showConfetti = false // Zustand für Konfetti anzeigen

    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HStack {
                        Image("Wolke1")
                            .resizable()
                            .frame(width: 85, height: 85)
                            .background(Color.hellblau)
                        
                        Text("PAPERLESS")
                            .foregroundColor(.black)
                            .padding(.leading, -100)
                            .font(.system(size: 30, weight: .heavy))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.hellblau)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 13)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, -110)
                    .background(Color.hellblau)

                    VStack(alignment: .leading, spacing: 5) {
                        TextFieldInput(label: "Vorname", text: $firstname)
                        TextFieldInput(label: "Nachname", text: $lastname)
                        TextFieldInput(label: "E-Mail", text: $email)
                            .autocapitalization(.none)
                            .onChange(of: email) { newValue in
                                email = newValue.lowercased()
                            }

                        SecureTextFieldInput(label: "Passwort", text: $password, showPassword: $showPassword, showEyeIcon: true)
                        SecureTextFieldInput(label: "Passwort bestätigen", text: $confirmPassword, showPassword: $showPassword, showEyeIcon: false)
                    }

                    Button("Registrieren") {
                        if validatePassword(password) {
                            if password == confirmPassword {
                                let newUser = LocalUserData(firstname: firstname, lastname: lastname, email: email, password: password)

                                AuthService.shared.registerUser(user: newUser) { result in
                                    switch result {
                                    case .success:
                                        errorMessage = "Registrierung erfolgreich!"
                                        isRegistred = true
                                        showConfetti = true  // Zeige Konfetti an

                                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                            showConfetti = false  // Verstecke Konfetti nach 3 Sekunden
                                        }

                                    case .failure(let error):
                                        errorMessage = error.localizedDescription
                                    }
                                }
                            } else {
                                errorMessage = "Passwort stimmt nicht überein!"
                            }
                        } else {
                            errorMessage = "Passwort muss mindestens 8 Zeichen, Groß-/Kleinbuchstaben, Zahl & Sonderzeichen enthalten!"
                        }
                    }
                    .frame(width: 269, height: 18)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 20)
                    .background(Color.hellblau)

                    Text(errorMessage)
                        .foregroundColor(errorMessage.contains("erfolgreich") ? .green : .red)

                    ContinueWithAppleView()
                        .frame(width: 269, height: 18)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.top, 5)
                        .background(Color.hellblau)

                    ContinueWithGoogleView()
                        .frame(width: 269, height: 18)
                        .font(.system(size: 20))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.top, 5)
                        .background(Color.hellblau)

                    NavigationLink(destination: HomeScreenViewT(), isActive: $isRegistred) {
                        EmptyView()
                    }

                    Spacer()

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

                    NavigationLink(destination: LoginViewT(), isActive: $navigateToLogin) {
                        EmptyView()
                    }
                }
                .background(Color.hellblau)

                // Konfetti-View, wenn `showConfetti` true ist
                if showConfetti {
                    ConfettiView(
                        shapes: [
                            .triangle,
                            .slimRectangle,
                            .roundedCross,
                            .emoji("🎉"),
                            .sfSymbol("heart.fill"),
                            .image(Image(systemName: "star.fill"))
                        ],
                        numberOfParticles: 40,
                        size: CGSize(width: 300, height: 400)
                    )
                    .transition(.opacity)
                    .zIndex(1) // Konfetti über anderen UI-Elementen anzeigen
                }
            }
        }
    }

    func validatePassword(_ password: String) -> Bool {
        let pattern = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: password)
    }
}


// Preview für ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
