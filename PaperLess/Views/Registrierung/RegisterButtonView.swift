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
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            
            
            
            //        Hintergrundfarbe
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appOnprimary)
            
        }
    }



struct RegisterButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegisterButtonView()
    }
}
