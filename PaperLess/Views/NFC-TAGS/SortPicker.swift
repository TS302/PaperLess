//
//  SortOption.swift
//  PaperLess
//
//  Created by Tom Salih on 26.04.25.
//

import SwiftUI


struct SortPicker: View {
    @Binding var selectedOption: SortOption
    var body: some View {
        
        Section{
            Picker("Sortieren nach", selection: $selectedOption) {
                ForEach(SortOption.allCases) { option in
                    Text(option.title).tag(option)
                }
            }
            .listRowBackground(Color.clear)
            .pickerStyle(.segmented)
            .padding(.top, 8)
            .padding(.horizontal, -18)
        }
    }
}
