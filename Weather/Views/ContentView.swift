import SwiftUI

struct ContentView: View {
    @ObservedObject var vm:LocationVM
    @ObservedObject var svm:SettingsVM
    
    var body: some View {
        
        NavigationView{
            SidebarView(vm: vm, svm: svm)
                
            EmptyView(svm: svm)
                
            
        }.background {
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: LocationVM(), svm: SettingsVM())
    }
}
