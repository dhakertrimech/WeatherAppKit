//
//  WeatherData.swift
//  Pods-WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

public struct WeatherData: Decodable {
    public let latitude: Double
    public let longitude: Double
    public let timezone: String
    public let timezoneOffset: Int
    public let current: CurrentWeather
    public let minutely: [MinutelyWeather]
    public let hourly: [HourlyWeather]
    public let daily: [DailyWeather]
    public let alerts: [WeatherAlert]?
}

public struct CurrentWeather: Decodable {
    public let dateTime: Date
    public let sunrise: Date
    public let sunset: Date
    public let temperature: Double
    public let feelsLike: Double
    public let pressure: Int
    public let humidity: Int
    public let dewPoint: Double
    public let uvi: Double
    public let clouds: Int
    public let visibility: Int
    public let windSpeed: Double
    public let windDegree: Int
    public let weather: [WeatherInfo]
    public let rain: Rain?
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

