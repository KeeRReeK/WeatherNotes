//
//  ItemInfoView.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 27.02.2026.
//

import SwiftUI

import SwiftUI

struct ItemInfoView: View {
    let note: NoteEntity
    @Binding var isPresented: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.32)
            .foregroundStyle(.softLime)
            .shadow(radius: 3, x: 3, y: 3)
            .overlay {
                VStack {
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(note.title ?? "Unknown")
                            .patuaOne(35)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(note.weatherDesc ?? "No description")
                                .patuaOne(25)
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                            
                            Text(note.locationName ?? "Unknown City")
                                .patuaOne(25)
                                .lineLimit(2)
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "sun.dust")
                                .font(.system(size: 35))
                            Text("\(Int(note.temperature))ºC")
                        }
                    }
                    
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Text("OK").patuaOne(40).foregroundStyle(.background)
                    }
                    .padding(.horizontal, 40)
                    .background(Color.lavenderPink)
                    .cornerRadius(15)
                }
                .padding()
            }
    }
}
