//
//  ListCityPresenter.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

protocol ListCityPresenterProtocol {
    func didSelectCity(city: String)
}

class ListCityPresenter: ListCityPresenterProtocol {
    private weak var view: ListCityViewDelegate?
    
    init(view: ListCityViewDelegate) {
        self.view = view
    }
    
    func didSelectCity(city: String) {
        view?.didSelectCity(city: city)
    }
}
