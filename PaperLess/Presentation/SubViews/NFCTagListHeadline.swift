//
//  NFCTagListHeader.swift
//  PaperLess
//
//  Created by Tom Salih on 26.06.25.
//

import SwiftUI

struct NFCTagListHeadline: View {
    
    @Binding var selectedSegment: Int
    var body: some View {
        HStack {
            if selectedSegment == 0 {
                Text("Fahrzeuge")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
            } else if selectedSegment == 1 {
                Text("Werkzeuge")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
            } else {
                Text("Schlüssel")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    NFCTagListHeadline(selectedSegment: .constant(0))
}
