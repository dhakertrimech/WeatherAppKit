Sure! Here's the updated README file with the usage instructions for OpenWeatherKit:

# OpenWeatherKit

[![CI Status](https://img.shields.io/travis/Dhaker-Zeta/OpenWeatherKit.svg?style=flat)](https://travis-ci.org/Dhaker-Zeta/OpenWeatherKit)
[![Version](https://img.shields.io/cocoapods/v/OpenWeatherKit.svg?style=flat)](https://cocoapods.org/pods/OpenWeatherKit)
[![License](https://img.shields.io/cocoapods/l/OpenWeatherKit.svg?style=flat)](https://cocoapods.org/pods/OpenWeatherKit)
[![Platform](https://img.shields.io/cocoapods/p/OpenWeatherKit.svg?style=flat)](https://cocoapods.org/pods/OpenWeatherKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

OpenWeatherKit is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'OpenWeatherKit'
```

## Usage

First, make sure you have an API token from OpenWeatherMap. You can obtain a token by signing up on their website.

```swift
import OpenWeatherKit

// Set the token
OpenWeatherKit.setToken("your_token_here")

// Fetch weather data for a city
OpenWeatherKit.fetchWeatherData(for: "London") { result in
    switch result {
    case .success(let weatherData):
        // Handle the success case and use the weather data
        print(weatherData)
    case .failure(let error):
        // Handle the failure case and display or log the error
        print("Failed to load city weather: \(error)")
    }
}
```

In the code above, we first set the token using the `setToken` method of `OpenWeatherKit`. Replace `"your_token_here"` with your actual OpenWeatherMap API token.

Then, we use the `fetchWeatherData` method to fetch the weather data for a specific city. The result is provided in the completion handler as a `Result` type, which can be either a success with the weather data or a failure with an error.

## Author

Dhaker, dhaker.trimeche@gmail.com

## License

OpenWeatherKit is available under the MIT license. See the LICENSE file for more info.
```

Please note that you should replace `"your_token_here"` with your actual OpenWeatherMap API token.
