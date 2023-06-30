//
//  WeatherKit.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation
public class WeatherKit {
    private static var token: String = ""
    
    public static func setToken(_ token: String) {
        self.token = token
    }
    
    public static func fetchWeatherData(for city: String, completionHandler: @escaping (Result<WeatherData, Error>) -> Void) {
        // Implementation of fetchWeatherData
    }
}

public struct WeatherData: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let timezoneOffset: Int
    let current: CurrentWeather
    let minutely: [MinutelyWeather]
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
    let alerts: [WeatherAlert]?
}

public struct CurrentWeather: Decodable {
    let dateTime: Date
    let sunrise: Date
    let sunset: Date
    let temperature: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDegree: Int
    let weather: [WeatherInfo]
    let rain: Rain?
}

public struct MinutelyWeather: Decodable {
    let dateTime: Date
    let precipitation: Double
}

public struct HourlyWeather: Decodable {
    let dateTime: Date
    let temperature: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDegree: Int
    let windGust: Double?
    let weather: [WeatherInfo]
    let pop: Double
}

public struct DailyWeather: Decodable {
    let dateTime: Date
    let sunrise: Date
    let sunset: Date
    let moonrise: Date
    let moonset: Date
    let moonPhase: Double
    let temperature: Temperature
    let feelsLike: FeelsLike
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let windSpeed: Double
    let windDegree: Int
    let weather: [WeatherInfo]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double
}

public struct Temperature: Decodable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let evening: Double
    let morning: Double
}

public struct FeelsLike: Decodable {
    let day: Double
    let night: Double
    let evening: Double
    let morning: Double
}

public struct WeatherAlert: Decodable {
    let senderName: String
    let event: String
    let start: Date
    let end: Date
    let description: String
    let tags: [String]
}

public struct WeatherInfo: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

public struct Rain: Decodable {
    let oneHour: Double
    
    private enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

