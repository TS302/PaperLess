//
//  ObjectSegmentPicker.swift
//  PaperLess
//
//  Created by Tom Salih on 07.06.25.
//

import SwiftUI

struct ObjectSegmentPicker: View {
    @Binding var selectedSegment: Int
    
    var body: some View {
        Picker("", selection: $selectedSegment) {
            Text("Fahrzeuge").tag(0)
            Text("Tools").tag(1)
            Text("Schlüssel").tag(2)
        }
        .pickerStyle(.segmented)
        .listRowSeparator(.hidden)
        .padding(.bottom, 10)
        .listRowBackground(Color.secondary)
    }
}

