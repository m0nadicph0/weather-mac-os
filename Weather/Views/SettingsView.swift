import SwiftUI

struct SettingsView: View {
    @ObservedObject var vm:SettingsVM

    var body: some View {
        TabView {
            CredentialsSettingsView(vm: vm)
                .tabItem {
                    Label("Credentials", systemImage: "person.crop.circle")
                }
        }
        .frame(width: 450, height: 250)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(vm: SettingsVM())
    }
}
