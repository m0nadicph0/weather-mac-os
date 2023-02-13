import Foundation

class LocationVM: ObservableObject {
    @Published var locations: [Location] = []
    
    
    func addLocation(location:Location) {
        self.locations.append(location)
    }
    
    func removeLocation(location:Location) {
        let index = self.locations.firstIndex{ $0.id == location.id}
        self.locations.remove(at: index!)
    }
    
    func addLocations(locations:[Location]) {
        self.locations.append(contentsOf: locations)
    }
    
}
