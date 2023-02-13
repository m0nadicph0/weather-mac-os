import Foundation


struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    
    struct Coord: Codable {
        let lon, lat: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let main, description, icon: String
    }
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min:Double
        let temp_max: Double
        let pressure:Int
        let humidity: Int
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
        let gust: Double
    }
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Sys: Codable {
        let type, id: Int
        let country: String
        let sunrise, sunset: Int
    }
}

