//
//  ContentView.swift
//  TempConverter
//
//  Created by Salim Hafid on 5/28/20.
//  Copyright © 2020 Salim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var inputNumber: String = ""
    @State var inputUnits = 0
    @State var outputUnits = 0
    
    let unitDisplay = ["Farenheit", "Celsius", "Kelvin"]
    let units = [UnitTemperature.fahrenheit, UnitTemperature.celsius, UnitTemperature.kelvin]
    
    var convertedResult: Double {
        let rawInput = Double(inputNumber) ?? 0
        let inputType = units[inputUnits]
        let outputType = units[outputUnits]
        let currentMeasure = Measurement(value: rawInput, unit: inputType)
        let result = currentMeasure.converted(to: outputType)
        return result.value
    }
                 
              
                
    var body: some View {
        NavigationView {
            Form {
                
                
                Section (header:Text("Amount in :")){
                       TextField("Temperature to convert from \(unitDisplay[inputUnits])", text: $inputNumber)
                           .keyboardType(.decimalPad)
                               }
          
                
                Section (header: Text("Convert from:")){
                   Picker("Starter Units", selection: $inputUnits)
                   {
                    ForEach(0..<units.count)
                    {
                        Text("\(self.unitDisplay[$0])")
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Convert to:")){
                                  Picker("Ending Units", selection: $outputUnits)
                                  {
                                   ForEach(0..<units.count)
                                   {
                                       Text("\(self.unitDisplay[$0])")
                                   }
                                    
                               }
                    .pickerStyle(SegmentedPickerStyle())
          
                               }
    
        Section (header: Text("Result")){
          
            Text("\(convertedResult, specifier: "%.2f") degrees \(unitDisplay[outputUnits])")
      
    }
            }
            .navigationBarTitle(Text("Temp Converter"))
        }
    
    }







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
