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
        
        VStack(alignment: .leading, spacing: 5) {
            
            
            TextField(label, text: $text)
            
                .padding()
                .frame(width: 300, height: 44)
                .background(RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .stroke(Color.blue, lineWidth: 1))
        }
        
        
        
        
        
//        Hintergrundfarbe
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hellblau)
    }
}

struct TextFieldInput_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldInput(label: "Text", text: .constant(""))
    }
}
