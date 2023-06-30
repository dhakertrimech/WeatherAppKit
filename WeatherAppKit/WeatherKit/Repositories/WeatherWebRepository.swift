//
//  CountriesWebRepository.swift
//  CountriesSwiftUI
//
//  Created by Alexey Naumov on 29.10.2019.
//  Copyright © 2019 Alexey Naumov. All rights reserved.
//

import Combine
import Foundation

import Combine
import Foundation

protocol WebRepository {
    func call<T: Decodable>(endpoint: APICall) -> AnyPublisher<T, Error>
}

protocol WeatherWebRepository {
    func loadCityWeather(cityName: String) -> AnyPublisher<WeatherData, Error>
}

struct RealWebRepository: WebRepository {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func call<T: Decodable>(endpoint: APICall) -> AnyPublisher<T, Error> {
        let urlRequest = endpoint.urlRequest
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

struct RealWeatherWebRepository: WeatherWebRepository {
    let webRepository: WebRepository
    
    func loadCityWeather(cityName: String) -> AnyPublisher<WeatherData, Error> {
        let endpoint = WeatherAPI.cityWeather(cityName)
        return webRepository.call(endpoint: endpoint)
    }
}

enum WeatherAPI {
    case cityWeather(String)
}

extension WeatherAPI: APICall {
    var baseURL: String {
        return ""
    }
    
    var path: String {
        switch self {
        case let .cityWeather(cityName):
            let encodedName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return "/name/\(encodedName ?? cityName)"
        }
    }
    
    var method: String {
        return "GET"
    }
    
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
