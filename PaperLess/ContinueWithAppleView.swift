//
//  ContinueWithAppleView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 09.04.25.
//

import SwiftUI

import AuthenticationServices

struct ContinueWithAppleView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userID") var userId: String = ""
    
    var body: some View {
        VStack {
            if userId.isEmpty {
                SignInWithAppleButton(.continue) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let auth):
                        switch auth.credential {
                        case let credential as ASAuthorizationAppleIDCredential:
                            let userId = credential.user
                            let email = credential.email
                            let firstName = credential.fullName?.givenName
                            let lastName = credential.fullName?.familyName
                            
                            self.email = email ?? ""
                            self.userId = userId
                            self.firstName = firstName ?? ""
                            self.lastName = lastName ?? ""
                        default:
                            break
                        }
                    case .failure(let error):
                        print("Apple Sign-In Fehler: \(error.localizedDescription)")
                    }
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                )
                
                .frame(width: 269, height: 18)
//                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .cornerRadius(10)
            }
        }
    }
}
