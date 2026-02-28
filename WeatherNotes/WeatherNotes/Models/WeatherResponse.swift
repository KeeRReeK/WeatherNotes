//
//  WeatherResponse.swift
//  WeatherNotes
//
//  Created by KeeR ReeK on 28.02.2026.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: MainWeather
    let weather: [WeatherDescription]
}

struct MainWeather: Decodable {
    let temp: Double
}

struct WeatherDescription: Decodable {
    let main: String
    let description: String
    let icon: String
}
