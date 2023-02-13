import Foundation

struct Location: Identifiable, Codable {
    var id = UUID()
    var name: String = ""
    var createdOn: Date = Date()
    var isFavourite: Bool = false
    var latitude:Double = 0
    var longitude:Double = 0
    
    init(name: String, isFavourite: Bool) {
        self.name = name
        self.isFavourite = isFavourite
    }
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = ""
    }
}
