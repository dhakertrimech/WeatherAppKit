//
//  ListCityViewController.swift
//  WeatherAppKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//
import Foundation
import UIKit

protocol ListCityViewDelegate: AnyObject {
    func didSelectCity(city: String)
}

class ListCityViewController: UIViewController {
    weak var delegate: ListCityViewDelegate?
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var cities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadCities()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    private func loadCities() {
        let cities = UserDefaultHelper.loadCities()
        tableView.reloadData()
    }
}

extension ListCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cities[indexPath.row]
        delegate?.didSelectCity(city: selectedCity)
        navigationController?.popViewController(animated: true)
    }
}
