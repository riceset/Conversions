import SwiftUI

struct Time: View {
    @State private var enteredNumber = ""
    @State private var firstRow = 0
    @State private var secondRow = 0
    var units = ["seconds", "minutes", "hours"]
    
    var conversion: String {
        
        let number = Float(enteredNumber) ?? 0
        let first = Float(firstRow)
        let second = Float(secondRow)
        
        let seconds = number
        let minutes = number
        let hours = number
        
        //Seconds - Minutes
        let secMin = seconds / 60
        //Seconds - Hours
        let secH = seconds / 3600
        //Minutes - Seconds
        let minSec = minutes * 60
        //Minutes - Hours
        let minH = minutes / 60
        //Hours - Seconds
        let HSec = hours * 3600
        //Hours - Minutes
        let HMin = hours * 60
        
        if first == 0 && second == 0 {
            return String(number) + " s"
        }
        if first == 1 && second == 1 {
            return String(number) + " min"
        }
        if first == 2 && second == 2 {
            return String(number) + " h"
        }
        
        if first == 0 && second == 1 && number == 0 {
            return String(number) + " min"
        }
        if first == 1 && second == 0 && number == 0 {
            return String(number) + " s"
        }
        if first == 2 && second == 0 && number == 0 {
            return String(number) + " min"
        }
        if first == 2 && second == 1 && number == 0 {
            return String(number) + " min"
        }
        if first == 0 && second == 2 && number == 0 {
            return String(number) + " h"
        }
        if first == 1 && second == 2 && number == 0 {
            return String(number) + " h"
        }
        
        if first == 0 && second == 1 {
            return String(secMin) + " min"
        }
        if first == 0 && second == 2 {
            return String(secH) + " h"
        }
        if first == 1 && second == 0 {
            return String(minSec) + " s"
        }
        if first == 1 && second == 2 {
            return String(minH) + " h"
        }
        if first == 2 && second == 0 {
            return String(HSec) + " s"
        }
        if first == 2 && second == 1 {
            return String(HMin) + " min"
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

struct Time_Previews: PreviewProvider {
    static var previews: some View {
        Time()
    }
}
