//
//  GeocodingData.swift
//  OpenWeatherKit
//
//  Created by Dhaker Trimech on 30/06/2023.
//

import Foundation

public struct GeocodingData: Decodable {
    let name: String
    let localNames: [String: String]
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case latitude = "lat"
        case longitude = "lon"
        case country
        case state
    }
}
