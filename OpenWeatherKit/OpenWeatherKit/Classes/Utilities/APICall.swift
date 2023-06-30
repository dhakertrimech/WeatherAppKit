//
//  APICall.swift
//  WeatherKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//
import Foundation

protocol APICall {
    var baseURL: String { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    func body() throws -> Data?
}

extension APICall {
    var urlRequest: URLRequest {
        let urlString = baseURL + path
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try? body()
        
        return request
    }
}
