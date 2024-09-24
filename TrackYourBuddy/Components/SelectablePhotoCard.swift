//
//  SelectablePhotoCard.swift
//  TrackYourBuddy
//
//  Created by Bahadır Tarcan on 24.09.2024.
//

import SwiftUI

struct SelectablePhotoCard: View {
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
            } else {
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                        Text("Gelişim Fotoğrafı\nSeç")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 200, height: 150)
                    
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
        }
    }
}

#Preview {
    SelectablePhotoCard()
}
