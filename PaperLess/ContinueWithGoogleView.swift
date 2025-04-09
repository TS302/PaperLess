//
//  ContinueWithGoogleView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 09.04.25.
//

import SwiftUI

struct ContinueWithGoogleView: View {
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            action?()
        }) {
            HStack(spacing: 12) {
                Image("google_g") 
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Text("Mit Google fortfahren")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)

                Spacer()
            }
            .frame(maxWidth: .infinity)
         //                            .frame(width: 269, height: 18)
         //                            .font(.system(size: 20))
         //                            .padding()
         //                            .background(Color.white)
         //                            .cornerRadius(10)
         //                            .padding(.top, 5)
            .frame(width: 269, height: 18)
            .padding(.horizontal, 16)
            .frame(height: 50)
//            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
        }
    }
}

struct ContinueWithGoogleView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueWithGoogleView()
            .padding()
            .previewLayout(.sizeThatFits)
         
    }
}
