//
//  RealWebRepository.swift
//  WeatherKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//
import Foundation

protocol WebRepository {
    func call<T: Decodable>(endpoint: APICall, completion: @escaping (Result<T, Error>) -> Void)
}

protocol WeatherWebRepository {
    func loadCityWeather(cityName: String, completion: @escaping (Result<WeatherData, Error>) -> Void)
    func geocodeCity(cityName: String, completion: @escaping (Result<GeocodingData, Error>) -> Void)
}

struct RealWebRepository: WebRepository {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func call<T: Decodable>(endpoint: APICall, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = endpoint.urlRequest
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct RealWeatherWebRepository: WeatherWebRepository {
    let webRepository: WebRepository
    
    func loadCityWeather(cityName: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        geocodeCity(cityName: cityName) { result in
            switch result {
            case .success(let geocodingData):
                let endpoint = WeatherAPI.cityWeather(geocodingData.latitude, geocodingData.longitude)
                self.webRepository.call(endpoint: endpoint, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func geocodeCity(cityName: String, completion: @escaping (Result<GeocodingData, Error>) -> Void) {
        let endpoint = GeocodingAPI.cityGeocode(cityName)
        webRepository.call(endpoint: endpoint, completion: completion)
    }
}

enum WeatherAPI {
    case cityWeather(Double, Double)
}

extension WeatherAPI: APICall {
    var baseURL: String {
        return "http://api.openweathermap.org/geo/1.0/direct"
    }
    
    var path: String {
        switch self {
        case let .cityWeather(lat, long):
            return "lat={\(lat)}&lon={\(long)}"
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

enum GeocodingAPI {
    case cityGeocode(String)
}

extension GeocodingAPI: APICall {
    var baseURL: String {
        return "http://api.openweathermap.org/geo/1.0/direct"
    }
    
    var path: String {
        switch self {
        case let .cityGeocode(cityName):
            let encodedName = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return "q=\(encodedName ?? cityName)"
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
