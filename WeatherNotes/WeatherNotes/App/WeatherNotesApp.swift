//
//  WeatherNotesApp.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 26.02.2026.
//

import SwiftUI

@main
struct WeatherNotesApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    let persistenceController = PersistenceController.shared
    @StateObject private var viewModel = NotesViewModel(
        context: PersistenceController.shared.container.viewContext
    )
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
