//
//  MainView.swift
//  TrackYourBuddy
//
//  Created by Bahadır Tarcan on 24.09.2024.
//

import SwiftUI
import PhotosUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<2) { index in
                            SelectablePhotoCard()
                                .frame(width: 380, height: 300)
                                .background(Color.gray)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.leading, -5)
                        }
                    }
                    .padding()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        NavigationLink(destination: CardView(cardNumber: 3, notes: "Bu üçüncü kartın notları.", weightSelection: 15)) {
                            Image(systemName: "gear")
                                .frame(width: 380, height: 300)
                                .background(Color.gray)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.leading, -5)
                        }
                        
                        NavigationLink(destination: CardView(cardNumber: 4, notes: "Bu dördüncü kartın notları.", weightSelection: 25)) {
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: 380, height: 300)
                                .background(Color.gray)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.leading, -5)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Track Your Friend")
        }
    }
        
}

#Preview {
    MainView()
}


