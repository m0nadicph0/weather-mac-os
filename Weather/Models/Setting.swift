import Foundation

struct Setting: Codable {
    var apiKey: String = ""
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
}

