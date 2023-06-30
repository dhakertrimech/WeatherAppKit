//
//  AddCityViewController.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation
import UIKit

protocol AddCityViewDelegate: AnyObject {
    func didAddCity(city: String)
}

class AddCityViewController: UIViewController {
    weak var delegate: AddCityViewDelegate?
    
    @IBOutlet private weak var cityTextField: UITextField!
    
    @IBAction private func addCityButtonTapped(_ sender: UIButton) {
        guard let city = cityTextField.text, !city.isEmpty else {
            return
        }
        
        delegate?.didAddCity(city: city)
        navigationController?.popViewController(animated: true)
    }
}
