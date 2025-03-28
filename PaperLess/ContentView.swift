//
//  ContentView.swift
//  PaperLess
//
//  Created by Tom Salih on 28.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.hellblau)

            Text("Hello, world!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.hellblau)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.dunkelblau)
        .padding()
    }
}

#Preview {
    ContentView()
}
