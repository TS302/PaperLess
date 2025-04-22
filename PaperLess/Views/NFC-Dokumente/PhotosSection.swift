//
//  PhotosSection.swift
//  PaperLess
//
//  Created by Tom Salih on 20.04.25.
//

import SwiftUI
import PhotosUI

struct PhotosSection: View {
    @Binding var selectedItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        Section(header: HStack {
            Text("Bilder")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.appPrimary)
            Spacer()
            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                Image(systemName: "photo.badge.plus")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.appPrimary)
            }
        }){
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(6)
                    .padding(.vertical, 10)
            }
        }
        .onChange(of: selectedItem) { oldItem, newItem in
            Task {
                if let photosPickerItem = newItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    selectedImage = image
                }
            }
        }
    }
}

#Preview {
    
    NavigationView {
        List {
            PhotosSection(
                selectedItem: .constant(nil),
                selectedImage: .constant(UIImage(systemName: "photo"))
            )
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Fotos")
    }
}

