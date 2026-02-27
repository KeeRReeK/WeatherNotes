//
//  ListView.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 26.02.2026.
//

import SwiftUI

struct Star: Hashable {
    let x: CGFloat
    let y: CGFloat
    let size: CGFloat
    let opacity: Double
}

struct ListView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var stars: [Star] = (0..<150).map { _ in
        Star(
            x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
            y: CGFloat.random(in: 0...UIScreen.main.bounds.height * 0.35),
            size: CGFloat.random(in: 1...3),
            opacity: Double.random(in: 0.1...0.9)
        )
    }
    
    var body: some View {
        ZStack {
            Color.aquaMint.ignoresSafeArea()
            
            ForEach(0..<150, id: \.self) { _ in
                Circle()
                    .fill(Color.white.opacity(Double.random(in: 0.1...0.9)))
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height * 0.35)
                    )
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isDarkMode.toggle()
                        }
                    } label: {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                            .font(.system(size: 25))
                            .foregroundStyle(.black)
                            .padding(12)
                            .background(
                                isDarkMode ? Color.white : Color.lemonCream
                            )
                            .cornerRadius(25)
                            .shadow(radius: 3, x: 3, y: 3)
                    }
                }
                .padding(.trailing)
                Text("Weather Notes")
                    .patuaOne(55)
                    .foregroundStyle(.lemonCream)
                    .shadow(radius: 3, x: 3, y: 3)
                
                Spacer()
                
                Rectangle()
                    .fill(Color.softLime)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.75)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 20
                        )
                    )
                    .overlay {
                        VStack {
                            HStack {
                                Text("Notes")
                                    .patuaOne(35)
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 25))
                                        .bold()
                                        .foregroundStyle(.black)
                                        .padding(12)
                                        .background(
                                            Color.lavenderPink
                                        )
                                        .cornerRadius(25)
                                        .shadow(radius: 3, x: 3, y: 3)
                                }
                            }
                            .padding()
                            Spacer()
                        }
                    }
            }
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    ListView()
}
