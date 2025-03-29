//
//  HomeView.swift
//  PaperLess
//
//  Created by Tom Salih on 29.03.25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userViewModel: UserViewModel
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.hellblau)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Color.dunkelblau)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.dunkelblau)]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance 
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(userViewModel.userArray, id: \.id) { user in
                        HStack {
                            Image(systemName: "person.fill")
                            Text(user.username)
                                .font(.footnote)
                                .fontWeight(.medium)
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(Color.white)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.hellblau)
                .foregroundStyle(Color.dunkelblau)
            }
            .navigationTitle("Benutzerdaten")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Hinzufügen (+) gedrückt")
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(Color.dunkelblau)
                    }
                }
            }
        }
    }
}


#Preview {
    HomeView(userViewModel: UserViewModel())
}
