//
//  ContentView.swift
//  WeSplit
//
//  Created by Daniel Jesus Callisaya Hidalgo on 28/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code:"USD"))
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode	(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
