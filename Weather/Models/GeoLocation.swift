import Foundation

struct GeoLocation: Decodable {
    var name: String = ""
    var lat: Double = 0
    var lon: Double = 0
    var country: String = ""
}
