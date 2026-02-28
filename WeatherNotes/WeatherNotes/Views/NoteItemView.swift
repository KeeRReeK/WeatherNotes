//
//  NoteItemView.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 27.02.2026.
//

import SwiftUI

struct NoteItemView: View {
    let note: NoteEntity
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(
                width: UIScreen.main.bounds.width * 0.85,
                height: UIScreen.main.bounds.height * 0.15
            )
            .foregroundStyle(.lavenderPink.opacity(0.85))
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text(note.title ?? "Unknown")
                            .patuaOne(30)
                            .lineLimit(1)
                        
                        Text(note.date?.formatted(date: .abbreviated, time: .shortened) ?? "")
                            .font(.subheadline)
                    }
                    Spacer()
                    
                    VStack {
                        if let iconCode = note.weatherIcon, !iconCode.isEmpty,
                           let url = URL(string: "https://openweathermap.org/img/wn/\(iconCode)@2x.png") {
                            
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 40, height: 40)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                case .failure:
                                    Image(systemName: "cloud.fill")
                                        .font(.system(size: 35))
                                        .foregroundColor(.gray)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            Image(systemName: "sun.dust")
                                .font(.system(size: 35))
                        }
                        
                        Text("\(Int(note.temperature))ºC")
                    }
                }
                .padding()
            }
            .shadow(radius: 3, x: 3, y: 3)
    }
}
