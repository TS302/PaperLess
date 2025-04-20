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
                .modifier(ListRowSubtitle())
            Spacer()
            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                Image(systemName: "plus.square.fill")
                    .foregroundColor(Color.appPrimary)
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
                if let item = newItem,
                   let data = try? await item.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    selectedImage = image
                }
            }
        }
    }
}
/*
#Preview {
    PhotosSection(selectetItem: <#Binding<PhotosPickerItem?>#>, selectedImage: <#Binding<UIImage?>#>)
}
*/
