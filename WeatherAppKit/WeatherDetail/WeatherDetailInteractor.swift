//
//  WeatherDetailInteractor.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation
import OpenWeatherKit

protocol WeatherDetailInteractorProtocol {
    func fetchWeatherData(for city: String)
}

protocol WeatherDetailInteractorOutput: AnyObject {
    func weatherDataFetched(weatherData: WeatherData)
    func weatherDataFetchFailed(with error: Error)
}

class WeatherDetailInteractor: WeatherDetailInteractorProtocol {
    weak var output: WeatherDetailInteractorOutput!
    
    func fetchWeatherData(for city: String) {
        OpenWeatherKit.fetchWeatherData(for: city) {  [weak self] result in
            switch result {
            case .success(let weatherData):
                self?.output.weatherDataFetched(weatherData: weatherData)
            case .failure(let error):
                self?.output.weatherDataFetchFailed(with: error)
            }
        }
    }
}
