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
            .foregroundStyle(.lavenderPink)
            .shadow(radius: 3, x: 3, y: 3)
            .overlay {
                VStack {
                    Spacer()
                    VStack(spacing: 4) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            Text(note.title ?? "Unknown")
                                .patuaOne(35)
                        }
                        Text(note.date?.formatted(date: .abbreviated, time: .shortened) ?? "")
                            .font(.subheadline)
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
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
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
                        .shadow(radius: 3, x: 3, y: 3)
                    }
                    
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Text("OK")
                            .patuaOne(40)
                    }
                    .padding(.horizontal, 40)
                    .background(.softLime)
                    .cornerRadius(15)
                }
                .padding()
            }
    }
}
