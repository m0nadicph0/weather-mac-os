import SwiftUI
import MapKit

struct WeatherView: View {
    let location:Location
    @ObservedObject var vm:WeatherVM
    @ObservedObject var svm:SettingsVM
    
    
    
    var body: some View {
        VStack{
            HStack{
                Text(location.name)
                    .font(.title)
                Spacer()
                Text("\(location.latitude), \(location.longitude)")
                Button {
                    self.vm.fetchWeather(apiKey: self.svm.setting.apiKey, latitude: location.latitude,
                                         longitude: location.longitude)
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                }
                
            }.padding()
            Divider()
            
            if let weather = self.vm.weatherData?.weather.first {
                
                if imageName(weather.description).isEmpty {
                    Text(weather.description)
                } else {
                    Image(systemName: imageName(weather.description))
                        .font(.system(size: 80))
                }
                Text(weather.main)
                    .font(.system(size: 15))
            }
            
            if let main = self.vm.weatherData?.main {
                Text("\(String(format: "%.0f°", main.temp))").font(.system(size: 40))
            }

            if let main = self.vm.weatherData?.main {
                Text("\(String(format: "H: %.0f° L: %.0f°", main.temp_max, main.temp_min))")
                    .font(.system(size: 15))
            }
            
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))),
                interactionModes: []).padding()
            
            Spacer()
        }.onAppear{
            self.vm.fetchWeather(apiKey: self.svm.setting.apiKey, latitude: location.latitude,
                                 longitude: location.longitude)
        }
    }
    
    func imageName(_ weather: String) -> String {
        switch weather {
        case "overcast clouds":
            return "cloud.fill"
        case "broken clouds":
            return "cloud.sun.fill"
        case "scattered clouds":
            return "cloud.sun.fill"
        case "clear sky":
            return "sun.max.fill"
        case "few clouds":
            return "cloud.sun.fill"
        case "moderate rain":
            return "cloud.rain.fill"
        case "light rain":
            return "cloud.rain.fill"
        case "smoke":
            return "smoke.fill"
        case "haze":
            return "sun.haze.fill"
        case "mist":
            return "cloud.fog.fill"
        case "snow":
            return "cloud.snow.fill"
        default:
            return ""
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let loc = Location(name: "London, England", latitude: 51.5072, longitude: 0.1276)
        WeatherView(location: loc, vm: WeatherVM(), svm: SettingsVM())
    }
}
