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
        SignInWithAppleButtonView {
//             Apple Login wird hier ausgeführt
        }
    }
}

struct SignInWithAppleButtonView: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            performAppleSignIn()
        }) {
            HStack(spacing: 12) {
                Image(systemName: "applelogo")
                
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)

                Text("Mit Apple fortfahren")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            .padding(.horizontal, 16)
            .frame(width: 269, height: 50)
            .background(Color.black)
            .cornerRadius(10)
        }
    }

    private func performAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.performRequests()
//         Du kannst hier Delegates hinzufügen für Erfolg/Fehler
        action()
    }
}

struct ContinueWithAppleView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueWithAppleView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
