//
//  AddCityInteractor.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

protocol AddCityInteractorProtocol {
    func addCity(cityName: String)
}

class AddCityInteractor: AddCityInteractorProtocol {
    private let userDefaults = UserDefaults.standard
    
    func addCity(cityName: String) {
        UserDefaultHelper.addCity(city: cityName)
    }
}
