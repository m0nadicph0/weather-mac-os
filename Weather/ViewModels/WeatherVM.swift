import Foundation

class WeatherVM: ObservableObject {
    @Published var weatherData: WeatherData?
    
    
    func fetchWeather(apiKey: String,latitude: Double, longitude: Double) {
        
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let wd = try JSONDecoder().decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        self.weatherData = wd
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
