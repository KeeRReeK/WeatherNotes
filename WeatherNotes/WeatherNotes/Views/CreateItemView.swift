//
//  CreateItemView.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 27.02.2026.
//

import SwiftUI

struct CreateItemView: View {
    
    @EnvironmentObject var viewModel: NotesViewModel
    @State private var text: String = ""
    @Binding var isPresented: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(
                width: UIScreen.main.bounds.width * 0.9,
                height: UIScreen.main.bounds.height * 0.20
            )
            .foregroundStyle(.softLime)
            .shadow(radius: 3, x: 3, y: 3)
            .overlay {
                VStack {
                    TextField("Note title", text: $text)
                        .patuaOne(35)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            await viewModel.saveNote(title: text)
                            isPresented = false
                        }
                    } label: {
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            Text("SAVE")
                                .patuaOne(40)
                        }
                    }
                    .padding(.horizontal, 40)
                    .background {
                        Color.lavenderPink
                    }
                    .cornerRadius(15)
                    .disabled(text.isEmpty || viewModel.isLoading)
                }
                .padding()
            }
            
    }
}

#Preview {
    CreateItemView(isPresented: .constant(true))
}
