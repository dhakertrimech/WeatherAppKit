//
//  UserDefaultHelper.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

final class UserDefaultHelper {
    private static let userDefaults = UserDefaults.standard
    private static let citiesKey = "Cities"
    
    private init() {}
    
    static func addCity(city: String) {
        var cities = userDefaults.stringArray(forKey: citiesKey) ?? []
        cities.append(city)
        userDefaults.set(cities, forKey: citiesKey)
    }
    
    static func loadCities() -> [String] {
        return userDefaults.stringArray(forKey: citiesKey) ?? []
    }
}
