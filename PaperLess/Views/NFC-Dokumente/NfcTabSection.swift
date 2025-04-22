//
//  TabSection.swift
//  PaperLess
//
//  Created by Tom Salih on 21.04.25.
//

import SwiftUI

struct NfcTabSection: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        Section {
            Picker("", selection: $selectedTab) {
                Text("Info").tag(0)
                Text("Notizen").tag(1)
                Text("Bilder").tag(2)
            }
            .pickerStyle(.segmented)
            .tint(Color.appError)
            .padding(.vertical, 8)
        }        
        .listRowBackground(Color.clear)
        .padding( -14)
    }
}

#Preview {
    var selectedTab = 1
    NfcTabSection(selectedTab: .constant(selectedTab))
}
