//
//  DocumentAndNFCTagPicker.swift
//  PaperLess
//
//  Created by Tom Salih on 26.06.25.
//

import SwiftUI

struct DocumentAndNFCTagPicker: View {
    @Binding var selectedSegment: Int
    var body: some View {
        HStack {
            Button {
                selectedSegment = 0
            } label: {
                Image(systemName: "airtag.radiowaves.forward.fill")
                    .padding(.trailing, 10)
                    .font(.system(size: 16))
                    .foregroundColor(selectedSegment == 0 ? .primary : .primary.opacity(0.4))
            }
            
            Button {
                selectedSegment = 1
            } label: {
                Image(systemName: "text.document.fill")
                    .padding(.trailing, 10)
                    .font(.system(size: 16))
                    .foregroundColor(selectedSegment == 1 ? .primary : .primary.opacity(0.4))
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    DocumentAndNFCTagPicker(selectedSegment: .constant(0))
}
