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
            
          
            
            Button("Mit Apple fortfahren") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                
            }
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(10)
            .font(.system(size: 17))
            
            Image("apple_logo")
                .resizable()
                .frame(width: 47, height: 50)
                .padding(.leading, -296 )
                
          
            
            
        }
        //        Hintergrundfarbe
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appOnprimary)
    }
}
struct AppleRegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AppleRegisterButtonView()
    }
}
