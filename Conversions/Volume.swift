import SwiftUI

struct Volume: View {
    @State private var enteredNumber = ""
    @State private var firstRow = 0
    @State private var secondRow = 0
    var units = ["liter", "milliliter"]
    
    var conversion: String {
        
        let number = Float(enteredNumber) ?? 0
        let first = Float(firstRow)
        let second = Float(secondRow)
        
        let liter = number
        let milliliter = number
        
        let Lml = liter * 1000
        let mlL = milliliter / 1000

        if first == 0 && second == 0 {
            return String(number) + " L"
        }
        if first == 1 && second == 1 {
            return String(number) + " ml"
        }

        if first == 0 && second == 1 && number == 0 {
            return String(number) + " ml"
        }
        if first == 1 && second == 0 && number == 0 {
            return String(number) + " L"
        }
        
        if first == 0 && second == 1 {
            return String(Lml) + " ml"
        }
        if first == 1 && second == 0 {
            return String(mlL) + " L"
        }
        
        return "Error"
    }

    var body: some View {
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
            .navigationBarItems(trailing:
                                    Button(action: {
                                        hideKeyboard()
                                    }, label: {
                                        Text("hide keyboard")
                                    })
            )
        }
    }
}

struct Volume_Previews: PreviewProvider {
    static var previews: some View {
        Volume()
    }
}
