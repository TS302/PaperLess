//
//  TextFieldInput.swift
//  PaperLess
//
//  Created by Oguzhan Cirpan on 10.04.25.
//

import SwiftUI

struct TextFieldInput: View {
    
    var label: String
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            TextField(label, text: $text)
                .padding(.leading, 10)
                .frame(height: 44)
                .background(RoundedRectangle(cornerRadius: 6)
                    .fill(Color.white)
                    .stroke(Color.appPrimary, lineWidth: 1))
        }
        //        Hintergrundfarbe
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .background(Color.appSecondary)
        
    }
}

struct TextFieldInput_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldInput(label: "Text", text: .constant(""))
    }
}
