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
            
            Button{
                //Action
            }label: {
                HStack{
                    Image("google_logo")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("Mit Google fortfahren")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(6)
            .font(.system(size: 17))
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 40)
                            
        }
        //        Hintergrundfarbe
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appSecondary)
    }
}
struct GoogleRegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleRegisterButtonView()
    }
}
