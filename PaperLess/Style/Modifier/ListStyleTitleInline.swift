//
//  ListStyleTitleInline.swift
//  PaperLess
//
//  Created by Tom Salih on 22.04.25.
//

import SwiftUI

struct ListStyleTitleInline: ViewModifier {
    let title: String
    
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
            .background(Color.appSecondary)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(title)")
                        .font(.headline)
                        .foregroundStyle(Color.appPrimary)
                }
            }
            .toolbarBackground(Color.appSecondary)
    }
}
/*
#Preview {
    ListStyleTitleInline(title: "Titel")
}
*/
