//
//  GoogleRegisterButtonView.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 15.04.25.
//

import SwiftUI

struct GoogleRegisterButtonView: View {
    
    var body: some View {
        
        
        
        HStack {
            
          
            
            Button("Mit Google fortfahren") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                
            }
            .frame(width: 300, height: 50)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(10)
            .font(.system(size: 17))
            
            Image("google_logo")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(.leading, -285 )
                
         
            
            
        }
        //        Hintergrundfarbe
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appOnprimary)
    }
}
struct GoogleRegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleRegisterButtonView()
    }
}
