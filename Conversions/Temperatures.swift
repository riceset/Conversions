import SwiftUI

struct Temperatures: View {
    //MARK: - Variables
    @State private var enteredNumber = ""
    @State private var firstRow = 0
    @State private var secondRow = 0
    var units = ["°C", "°F", "K"]
    //MARK: - Logic
    
    var conversion: String {
        let number = Float(enteredNumber) ?? 0
        let first = Float(firstRow)
        let second = Float(secondRow)
        
        ///Declaring
        let celsius = number
        let fahrenheit = number
        let kelvin = number
        
        ///Celsius - Fahrenheit
        let celFah = celsius * 9 / 5
        let celFah2 = celFah + 32
        
        ///Fahrenheit - Celsius
        let fahCel = fahrenheit - 32
        let fahCel2 = fahCel * 5 / 9
        
        ///Celsius - Kelvin
        let celKel = kelvin + 273.15
        
        ///Kelvin - Celsius
        let kelCel = kelvin - 273.15
        
        ///Fahrenheit - Kelvin
        let fahKel = kelvin - 32
        let fahKel2 = fahKel * 5 / 9 + 273.15
        
        ///Kelvin - Fahrenheit
        let kelFah = kelvin - 273.15
        let kelFah2 = kelFah * 9 / 5 + 32
        
        if first == 0 && second == 0 {
            return String(number) + "°C"
        }
        if first == 1 && second == 1 {
            return String(number) + "°F"
        }
        if first == 2 && second == 2 {
            return String(number) + "K"
        }
        
        if first == 0 && second == 1 && number == 0 {
            return String(number) + "°F"
        }
        if first == 1 && second == 0 && number == 0 {
            return String(number) + "°C"
        }
        if first == 2 && second == 0 && number == 0 {
            return String(number) + "°C"
        }
        if first == 2 && second == 1 && number == 0 {
            return String(number) + "°F"
        }
        if first == 0 && second == 2 && number == 0 {
            return String(number) + "K"
        }
        if first == 1 && second == 2 && number == 0 {
            return String(number) + "K"
        }
        
        if first == 0 && second == 1 {
            return String(celFah2) + "°F"
        }
        if first == 1 && second == 0 {
            return String(fahCel2) + "°C"
        }
        if first == 0 && second == 2 {
            return String(celKel) + "K"
        }
        if first == 2 && second == 0 {
            return String(kelCel) + "C"
        }
        if first == 2 && second == 1 {
            return String(kelFah2) + "F"
        }
        if first == 1 && second == 2 {
            return String(fahKel2) + "K"
        }
        
        return "Error"
    }

    
    var body: some View {
        //MARK: - Celsius - Fahrenheit
        NavigationView {
            Form {
                Section(header: Text("Convert")) {
                    TextField("", text: $enteredNumber)
                    .keyboardType(.numberPad)
                }
                Section(header: Text("From")) {
                    Picker("", selection: $firstRow) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")) {
                    Picker("", selection: $secondRow) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(conversion)")
                }
                
            }.navigationBarTitle("Conversions")
            .navigationBarItems(trailing:                     Button(action: {
                self.hideKeyboard()
            }, label: {
                Text("Run")
            }))
        }
    }
}
























struct Temperatures_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
