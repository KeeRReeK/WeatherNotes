//
//  ListView.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 26.02.2026.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ZStack {
            Color.aquaMint.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "moon.fill")
                            .font(.system(size: 25))
                            .foregroundStyle(.black)
                            .padding(12)
                            .background(
                                Color.white
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
