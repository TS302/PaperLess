//
//  SortMenu.swift
//  PaperLess
//
//  Created by Tom Salih on 07.06.25.
//

import SwiftUI

struct SortMenu: View {
    let onAlphaSort: () -> Void
    let onStatusSort: () -> Void
    
    var body: some View {
        Menu {
            Button("Alphabetisch", action: onAlphaSort)
            Button("Status",       action: onStatusSort)
        } label: {
            Image(systemName: "arrow.up.arrow.down.circle")
        }
        .tint(Color.primary)
    }
}
