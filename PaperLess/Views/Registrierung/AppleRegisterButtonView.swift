//
//  AppleRegisterButtonView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 15.04.25.
//

import SwiftUI

struct AppleRegisterButtonView: View {
    
    var body: some View {
        
        HStack {
            Button {
                //Action
            }label: {
                HStack {
                    Image("Apple_Logo")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Mit Apple fortfahren")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
            .font(.system(size: 17))
            .padding(.horizontal, 40)
        }
        //        Hintergrundfarbe
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appSecondary)
    }
}
struct AppleRegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AppleRegisterButtonView()
    }
}
