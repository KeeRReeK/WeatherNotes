//
//  NoteItemView.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 27.02.2026.
//

import SwiftUI

struct NoteItemView: View {
    
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
                        Text("Text notion")
                            .patuaOne(30)
                            .lineLimit(1)
                        Text("20 December, 15:25")
                    }
                    Spacer()
                    
                    VStack {
                        Image(systemName: "sun.dust")
                            .font(.system(size: 35))
                        
                        Text("20ºC")
                    }
                }
                .padding()
            }
            .shadow(radius: 3, x: 3, y: 3)
    }
}

#Preview {
    NoteItemView()
}
