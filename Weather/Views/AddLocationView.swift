import SwiftUI


struct AddLocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel:LocationVM
    @ObservedObject var svm:SettingsVM
    @State private var locationName:String = ""
    
    var body: some View {
        Form{
            VStack(alignment: .leading){
                Text("New Location")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Divider()
                
                HStack{
                    Text("Location")
                    TextField("", text: $locationName)
                }.padding(.top, 10)
                Spacer()
                
                Divider()
                HStack {
                    Spacer()
                    Button("Save"){
                        self.fetchData { (result) in
                            DispatchQueue.main.async {
                                do {
                                    let geolocations = try JSONDecoder().decode([GeoLocation].self, from: result)
                                    let geolocation = geolocations.first ?? GeoLocation()
                                    
                                    if geolocation.name.isEmpty {
                                        return
                                    }
                                    
                                    let locName = "\(geolocation.name), \(geolocation.country.toCountry())"
                                    viewModel.addLocation(location: Location(name: locName,
                                                                             latitude: geolocation.lat,
                                                                             longitude: geolocation.lon))
                                } catch {
                                    print(error)
                                }
                            }
                            
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(locationName.isEmpty)
                    .keyboardShortcut(.defaultAction)
                }
                
                
            }
        }.padding()
            .frame(width: 400, height: 200)
    }
    
    private func fetchData(completion: @escaping (Data) -> Void) {
        let apiKey = self.svm.setting.apiKey
        let escapedName = locationName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        let apiUrl = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(escapedName)&appid=\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: apiUrl) { data, resp, error in
            if let error = error {
                completion(Data("Error: \(error.localizedDescription)".utf8))
            } else if let data = data {
                completion(data)
            } else {
                completion(Data("Unknown error".utf8))
            }
        }
        task.resume()
    }
}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(viewModel: LocationVM(), svm: SettingsVM())
    }
}
