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
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
