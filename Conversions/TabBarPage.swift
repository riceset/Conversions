import SwiftUI

//hide keyboard
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct TabBarPage: View {
    @State private var selected = 0
    var body: some View {
        TabView(selection: $selected) {
            
            Temperatures().tabItem {
                Image(systemName: "thermometer")
                Text("Temperature")
            }
            Time().tabItem {
                Image(systemName: "clock")
                Text("Time")
            }
            Volume().tabItem {
                Image(systemName: "drop")
                Text("Volume")
            }
        }
    }
}

struct TabBarPage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPage()
    }
}
