//
//  AddCityPresenter.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

protocol AddCityPresenterProtocol {
    func addCityButtonTapped(cityName: String)
}

class AddCityPresenter: AddCityPresenterProtocol {
    private weak var view: AddCityViewDelegate?
    private let interactor: AddCityInteractorProtocol
    
    init(view: AddCityViewDelegate, interactor: AddCityInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func addCityButtonTapped(cityName: String) {
        interactor.addCity(cityName: cityName)
        view?.didAddCity(city: cityName)
    }
}
