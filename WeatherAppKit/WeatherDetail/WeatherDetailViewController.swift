//
//  WeatherDetailViewController.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation
import UIKit
import OpenWeatherKit

protocol WeatherDetailViewProtocol: AnyObject {
    func displayWeatherData(weatherData: WeatherData)
    func displayError(message: String)
}

class WeatherDetailViewController: UIViewController, WeatherDetailViewProtocol {
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    var selectedCity: String?
    var presenter: WeatherDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    func displayWeatherData(weatherData: WeatherData) {
        DispatchQueue.main.async { [weak self] in
            self?.cityNameLabel.text = "\(weatherData.current.humidity)"
            self?.temperatureLabel.text = "\(weatherData.current.temperature)°C"
        }
    }
    
    func displayError(message: String) {
    
    }
}
