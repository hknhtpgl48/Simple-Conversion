//
//  ContentView.swift
//  Simple Conversion
//
//  Created by Hakan Hatipoğlu on 1.01.2024.
//

import SwiftUI

struct ContentView: View {
    let units = ["meters", "kmeters", "feet", "yard", "miles"]
    @State private var inputUnit = "meters"
    @State private var outputUnit = "meters"
    @State private var input = 0.0
    @FocusState private var inputIsFocused: Bool
    var baseUnit: Double {
        switch inputUnit {
        case "kmeters":
            return input * 1000
        case "feet":
            return input / 3.281
        case "yard":
            return input / 1.094
        case "miles":
            return input * 1609
        default:
            return input
        }
    }
    var output: Double {
        switch outputUnit {
        case "kmeters":
            return baseUnit / 1000
        case "feet":
            return baseUnit * 3.281
        case "yard":
            return baseUnit * 1.094
        case "miles":
            return baseUnit / 1609
        default:
            return baseUnit
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from"){
                    Picker("Input", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Convert to"){
                    Picker("Input", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    TextField("aa", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                Section("Result:") {
                    Text("\(input.formatted()) \(inputUnit) => \(output.formatted()) \(outputUnit)")
                }
            }
            .navigationTitle("Simple Conversion")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
