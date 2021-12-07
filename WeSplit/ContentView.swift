//
//  ContentView.swift
//  WeSplit
//
//  Created by Daniel Jesus Callisaya Hidalgo on 28/11/21.
//
// Challenge Version
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0]
    // Challenge 4
    let currencyFormat: FloatingPointFormatStyle<Double>.Currency = .currency(code:  Locale.current.currencyCode ?? "USD")
    // Challenge 2 var :
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        return checkAmount * (1 + tipSelection/100)
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                  
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section{
              
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }// Challenge 3 whitout .pickerStyle(.segmented)
                    }header: {
                        Text("How much tip do you want to leave?")
                    }
                Section {
                    Text(totalPerPerson, format: currencyFormat)
                //Challenge 1 Header third Section
                }header: {
                    Text("Amount per Person")
                }
                //Challenge 2 total amount
                Section{
                    Text(totalAmount , format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Total Amount")
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode	(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
