//
//  CardView.swift
//  TrackYourBuddy
//
//  Created by Bahadır Tarcan on 24.09.2024.
//

import SwiftUI

struct CardView: View {
    let cardNumber: Int
    let notes: String
    @State private var selectedWeight: Int
    @State private var expandedDay: String? = nil
    @State private var dailyNotes: [String: String] = ["Pazartesi": "", "Salı": "", "Çarşamba": "", "Perşembe": "", "Cuma": "", "Cumartesi": "", "Pazar": ""]
    
    init(cardNumber: Int, notes: String, weightSelection: Int) {
        self.cardNumber = cardNumber
        self.notes = notes
        self._selectedWeight = State(initialValue: weightSelection)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(weekDays, id: \.self) { day in
                VStack(alignment: .leading) {
                    // Gün başlığı
                    Button(action: {
                        withAnimation {
                            expandedDay = (expandedDay == day) ? nil : day
                        }
                    }) {
                        HStack {
                            Text(day)
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Image(systemName: expandedDay == day ? "chevron.up" : "chevron.down")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.green.opacity(0.3))
                    .cornerRadius(8)
                    
                    // Günlük notlar
                    if expandedDay == day {
                        VStack(alignment: .leading, spacing: 8) {
                            TextEditor(text: Binding(
                                get: { dailyNotes[day] ?? "" },
                                set: { dailyNotes[day] = $0 }
                            ))
                            .frame(height: 100)
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            
            // KG seçimi alanı
            VStack {
                Text("KG Giriniz:")
                    .foregroundStyle(.white)
                Picker("Kg Seçin", selection: $selectedWeight) {
                    ForEach(0..<101, id: \.self) {
                        Text("\($0) kg")
                    }
                }
                .pickerStyle(.menu)
                .accentColor(.white)
            }
            .frame(width: 370, height: 100)
            .background(.green.opacity(0.3))
            .border(.green, width: 1)
            .cornerRadius(10)
            .padding(.top, 20)
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// Haftanın günleri
let weekDays = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"]

#Preview {
    CardView(cardNumber: 1, notes: "Example Notes", weightSelection: 10)
}
