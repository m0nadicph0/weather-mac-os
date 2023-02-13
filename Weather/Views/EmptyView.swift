import SwiftUI

struct EmptyView: View {
    @ObservedObject var svm:SettingsVM
    
    var body: some View {
        VStack {
            if svm.setting.apiKey.isEmpty {
                Text("API Key not provided. Please set it in the settings screen and restart the app.")
            } else {
                Text("No locations selected. Select a location form sidebar to view weather data.")
                HStack{
                    Text("Press")
                    Text("􀆔+i").fontWeight(.bold)
                    Text("to add a location.")
                }
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(svm: SettingsVM())
    }
}
