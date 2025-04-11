//
//  SecureTextFieldInput.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import SwiftUI

struct SecureTextFieldInput: View {
    var label: String
    @Binding var text: String
    @Binding var showPassword: Bool
    var showEyeIcon: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                if showPassword {
                    TextField(label, text: $text)
                } else {
                    SecureField(label, text: $text)
                }

                if showEyeIcon {
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .frame(width: 300, height: 44)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white).stroke(Color.blue, lineWidth: 1))
            .background(Color.hellblau)
        }
        .padding(.bottom, 5)
    }
}

struct SecureTextFieldInput_Previews: PreviewProvider {
    static var previews: some View {
//         Testvorschau mit konstanten Bindings
        SecureTextFieldInput(
            label: "Test-Passwort",
            text: .constant("geheim"),
            showPassword: .constant(false),
            showEyeIcon: true
        )
    }
}

