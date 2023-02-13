import Foundation

class SettingsVM: ObservableObject {
    @Published var setting: Setting = Setting(apiKey: "")
    
    func put(setting:Setting) {
        self.setting = setting
    }    
}
