//
//  RegisterButtonView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 15.04.25.
//

import SwiftUI

struct RegisterButtonView: View {
    
    var body: some View {
    
          
            Button("Registrieren") {
                //Action
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(6)
            .font(.system(size: 17))
            
            //        Hintergrundfarbe
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 40)
            .background(Color.appSecondary)
            
        }
    }



struct RegisterButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegisterButtonView()
    }
}
