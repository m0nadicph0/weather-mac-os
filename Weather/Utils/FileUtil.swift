import Foundation

class FileUtil {
    class func loadLocations(_ fileName: String) -> [Location] {
        let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
        var loadedLocations: [Location] = []
        do {
            let data = try Data(contentsOf: fileURL)
            let locations = try JSONDecoder().decode([Location].self, from: data)
            locations.forEach { location in
                loadedLocations.append(location)
            }
        } catch {
            print("Failed to load location list: \(error)")
        }

        return loadedLocations
    }

    class func saveLocations(_ fileName: String, locations: [Location]) {
        let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
        do {
            let data = try JSONEncoder().encode(locations)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save location list: \(error)")
        }
    }
    
    class func loadSetting(_ fileName: String) -> Setting {
        let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
        
        do {
            let data = try Data(contentsOf: fileURL)
            let setting = try JSONDecoder().decode(Setting.self, from: data)
            return setting
        } catch {
            print("Failed to load settings: \(error)")
        }

        return Setting(apiKey: "")
    }
    
    class func saveSetting(_ fileName: String, setting: Setting) {
        let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(fileName)
        do {
            let data = try JSONEncoder().encode(setting)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save settings: \(error)")
        }
    }
    

}
