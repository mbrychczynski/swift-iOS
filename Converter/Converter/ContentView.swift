//
//  ContentView.swift
//  Converter
//
//  Created by Mateusz Brychczynski on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var input: Double = 0
    @State private var selectedUnits = 0
    @State private var inputUnit: Dimension = UnitLength.feet
    @State private var outputUnit: Dimension = UnitLength.yards
    @FocusState private var amountIsFocused: Bool
    
    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    let unitTypes = [
        [UnitLength.feet, UnitLength.yards, UnitLength.meters, UnitLength.kilometers, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds, UnitMass.stones],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
    let formatter: MeasurementFormatter
    
    var result: String {
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        
        return formatter.string(from: outputMeasurement)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Amount to convert")
                }
                
                Picker("Conversion", selection: $selectedUnits) {
                    ForEach(0..<conversions.count) {
                        Text(conversions[$0])
                    }
                }
                
                Picker("Convert from", selection: $inputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
//                .pickerStyle(.segmented)
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(unitTypes[selectedUnits], id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
//                .pickerStyle(.segmented)
                
                Section {
                    Text(result)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Length Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            .onChange(of: selectedUnits) { newSelection in
                let units = unitTypes[newSelection]
                inputUnit = units[0]
                outputUnit = units[1]
            }
        }
    }
    
    init () {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
