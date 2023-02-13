import SwiftUI

var viewModel = LocationVM()
var settingsVM = SettingsVM()

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    func applicationDidFinishLaunching(_ notification: Notification) {
        viewModel.addLocations(locations: FileUtil.loadLocations("locations.json"))
        settingsVM.put(setting: FileUtil.loadSetting("settings.json"))
    }

    func applicationWillTerminate(_ notification: Notification) {
        FileUtil.saveLocations("locations.json", locations: viewModel.locations)
    }
}

@main
struct WeatherApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView(vm: viewModel, svm: settingsVM)
                
        }.windowStyle(.hiddenTitleBar)
        
        Settings{
            SettingsView(vm: settingsVM)
        }
    }
}
