import SwiftUI

struct CredentialsSettingsView: View {
    @ObservedObject var vm:SettingsVM
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Section(header: Text("Open Weather")) {
                TextField("API Key", text: $vm.setting.apiKey)
            }
            Spacer()
            Divider()
            HStack {
                Spacer()
                Button("Save") {
                    FileUtil.saveSetting("settings.json", setting: vm.setting)
                }.buttonStyle(.borderedProminent)
            }
            
        }.padding()
    }
}

struct CredentialsSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsSettingsView(vm: SettingsVM())
    }
}
