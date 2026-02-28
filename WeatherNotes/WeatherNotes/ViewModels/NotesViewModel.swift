//
//  NotesViewModel.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 28.02.2026.
//

import SwiftUI
import CoreData
import Combine

@MainActor
final class NotesViewModel: ObservableObject {
    @Published var notes: [NoteEntity] = []
    @Published var isLoading = false
    
    let locationManager = LocationManager()
    private let weatherService: WeatherServiceProtocol
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext, weatherService: WeatherServiceProtocol? = nil) {
        self.context = context
        self.weatherService = weatherService ?? WeatherService()
        fetchNotes()
    }
    
    func fetchNotes() {
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \NoteEntity.date, ascending: false)]
        
        do {
            notes = try context.fetch(request)
        } catch {
            print("Error fetching notes: \(error)")
        }
    }
    
    func saveNote(title: String) async {
        guard !title.isEmpty else { return }
        isLoading = true
        
        do {
            let weatherData = try await weatherService.fetchWeather(for: locationManager.currentCity)
            
            let newNote = NoteEntity(context: context)
            newNote.id = UUID()
            newNote.title = title
            newNote.date = Date()
            newNote.locationName = weatherData.name
            newNote.temperature = weatherData.main.temp
            newNote.weatherIcon = weatherData.weather.first?.icon ?? ""
            newNote.weatherDesc = weatherData.weather.first?.description ?? ""
            
            try context.save()
            fetchNotes()
            
        } catch {
            print("Failed to save note: \(error)")
        }
        
        isLoading = false
    }
}
