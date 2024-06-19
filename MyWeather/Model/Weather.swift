//
//  Weather.swift
//  MyWeather
//
//  Created by 김윤우 on 6/19/24.
//

import Foundation
// MARK: - Welcome
struct Weathers: Codable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
}
