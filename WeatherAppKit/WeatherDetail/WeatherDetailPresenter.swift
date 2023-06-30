//
//  WeatherDetailPresenter.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation
import OpenWeatherKit

protocol WeatherDetailPresenterProtocol {
    func viewDidLoad()
}

class WeatherDetailPresenter: WeatherDetailPresenterProtocol {
    weak var view: WeatherDetailViewProtocol!
    var interactor: WeatherDetailInteractorProtocol!
    var selectedCity: String?
    
    init(view: WeatherDetailViewProtocol, interactor: WeatherDetailInteractorProtocol, selectedCity: String) {
        self.view = view
        self.interactor = interactor
        self.selectedCity = selectedCity
    }
    
    func viewDidLoad() {
        guard let city = selectedCity else { return }
        interactor.fetchWeatherData(for: city)
    }
}

extension WeatherDetailPresenter: WeatherDetailInteractorOutput {
    func weatherDataFetched(weatherData: WeatherData) {
        view.displayWeatherData(weatherData: weatherData)
    }
    
    func weatherDataFetchFailed(with error: Error) {
        view.displayError(message: error.localizedDescription)
    }
}
