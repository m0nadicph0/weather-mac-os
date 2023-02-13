import SwiftUI

struct SidebarView: View {
    @ObservedObject var vm:LocationVM
    @ObservedObject var svm:SettingsVM

    @State var isPresented = false
    
    var body: some View {
        VStack(alignment: .leading){
            List() {
                Section("Favourite") {
                    ForEach($vm.locations) { $location in
                        if location.isFavourite {
                            NavigationLink{
                                WeatherView(location: location, vm: WeatherVM(), svm: svm)
                                
                            } label: {
                                HStack {
                                    Image(systemName: "star.circle")
                                    Text(location.name)
                                }
                            }.contextMenu{
                                Button {
                                    location.isFavourite = false
                                } label: {
                                    Text("Remove from favourite")
                                }
                            }
                        }
                    }
                }
                Section("Recent") {
                    ForEach($vm.locations) { $location in
                        if !location.isFavourite {
                            NavigationLink{
                                WeatherView(location: location, vm: WeatherVM(), svm: svm)
                                    
                            } label: {
                                HStack {
                                    Image(systemName: "mappin.circle.fill")
                                    Text(location.name)
                                }
                            }.contextMenu{
                                Button {
                                    location.isFavourite = true
                                } label: {
                                    Text("Favourite")
                                }
                                Divider()
                                Button {
                                    vm.removeLocation(location: location)
                                } label: {
                                    Text("Remove")
                                }

                                
                            }
                        }
                    }
                    
                }
            }
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                HStack{
                    Image(systemName: "plus.circle")
                    Text("Add location")
                }
                
            }.buttonStyle(.plain).padding()
                .keyboardShortcut("i")
                .sheet(isPresented: $isPresented) {
                    AddLocationView(viewModel: vm, svm: svm)                        
                }
            
            
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(vm: LocationVM(), svm: SettingsVM())
    }
}
