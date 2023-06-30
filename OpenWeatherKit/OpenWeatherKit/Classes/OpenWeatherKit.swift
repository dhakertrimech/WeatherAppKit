//
//  OpenWeatherKit.swift
//  OpenWeatherKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

public class OpenWeatherKit {
    private static var token: String = ""
    
    public static func setToken(_ token: String) {
        self.token = token
    }
    
    public static func fetchWeatherData(for city: String, completionHandler: @escaping (Result<WeatherData, Error>) -> Void) {
        let webRepository = RealWebRepository() // Create an instance of the web repository
        let weatherRepository = RealWeatherWebRepository(webRepository: webRepository) // Create an instance of the weather repository
        weatherRepository.loadCityWeather(cityName: city) { result in
            switch result {
            case .success(let weatherData):
                // Handle the success case and use the weather data
                print(weatherData)
            case .failure(let error):
                // Handle the failure case and display or log the error
                print("Failed to load city weather: \(error)")
            }
        }
    }
}
