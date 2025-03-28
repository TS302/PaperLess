//
//  HomeView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userViewModel: UserViewModel
    var body: some View {
        Text("Hello, Homeview!")
    }
}

#Preview {
    HomeView(userViewModel: UserViewModel())
}
