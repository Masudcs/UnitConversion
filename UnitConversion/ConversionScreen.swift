//
//  TemperatureConversion.swift
//  WeSplit
//
//  Created by Md. Masud Rana on 1/8/23.
//

import SwiftUI

struct ConversionScreen: View {
    @State private var inputnumber = ""
    @State private var unitType = "Temperature"
    @State private var inputType = "Celsius"
    @State private var outputType = "Fahrenheit"
    
    private var unitTypes = ["Temperature", "Length", "Time", "Volume"]

    var selectUnitCatagory: [String] {
        switch unitType {
        case "Temperature":
            return ["Celsius", "Fahrenheit", "Kelvin"]
        case "Length":
            return ["Meters", "Kilometers","Feet", "Yards", "Miles"]
        case "Time":
            return ["Seconds", "Minutes", "Hours","Days"]
        default:
            return ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
        }
    }
    var numberInDouble: Double {
        return Double(inputnumber) ?? 0.0
    }
    
    var temperatureResult: Double {
        if inputType == "Celsius" {
            switch outputType {
            case "Kelvin" :
                return numberInDouble + 273.15
            case "Fahrenheit":
                return (numberInDouble * 9 / 5) + 32
            default:
                return numberInDouble
            }
        } else if inputType == "Fahrenheit" {
            switch outputType {
            case "Celsius" :
                return (numberInDouble - 32) * 5 / 9
            case "Kelvin":
                return (numberInDouble - 32) * 5 / 9 + 273.15
            default:
                return numberInDouble
            }
        }
        else {
            switch outputType {
            case "Celsius" :
                return numberInDouble - 273.15
            case "Fahrenheit":
                return (numberInDouble - 273.15) * 9 / 5 + 32
            default:
                return numberInDouble
            }
        }
    }
    
    var lengthResult: Double {
        if inputType == "Meters" {
            switch outputType {
            case "Kilometers":
                return numberInDouble / 1000
            case "Feet" :
                return numberInDouble * 3.28084
            case "Yards":
                return numberInDouble * 1.094
            case "Miles":
                return numberInDouble / 1609.34
            default:
                return numberInDouble
            }
        } else if inputType == "Kilometers" {
            switch outputType {
            case "Meters":
                return numberInDouble * 1000.0
            case "Feet" :
                return numberInDouble * 3280.84
            case "Yards":
                return numberInDouble * 1093.6133
            case "Miles":
                return numberInDouble / 1.609
            default:
                return numberInDouble
            }
        } else if inputType == "Feet" {
            switch outputType {
            case "Meters":
                return numberInDouble / 3.281
            case "Kilometers" :
                return numberInDouble / 3281
            case "Yards":
                return numberInDouble / 3
            case "Miles":
                return numberInDouble / 5280
            default:
                return numberInDouble
            }
        } else if inputType == "Yards" {
            switch outputType {
            case "Meters":
                return numberInDouble / 1.094
            case "Kilometers" :
                return numberInDouble / 1094
            case "Feet":
                return numberInDouble * 3
            case "Miles":
                return numberInDouble / 1760
            default:
                return numberInDouble
            }
        }
        else {
            switch outputType {
            case "Meters":
                return numberInDouble * 1609
            case "Kilometers" :
                return numberInDouble * 1.609
            case "Feet":
                return numberInDouble * 5280
            case "Yards":
                return numberInDouble * 1760
            default:
                return numberInDouble
            }
        }
    }
    var timeResult: Double {
        if inputType == "Seconds" {
            switch outputType {
            case "Minutes":
                return numberInDouble / 60
            case "Hours" :
                return numberInDouble / 3600
            case "Days":
                return numberInDouble / 86400
            default:
                return numberInDouble
            }
        } else if inputType == "Minutes" {
            switch outputType {
            case "Seconds":
                return numberInDouble * 60
            case "Hours" :
                return numberInDouble / 60
            case "Days":
                return numberInDouble / 3600
            default:
                return numberInDouble
            }
        } else if inputType == "Hours" {
            switch outputType {
            case "Seconds":
                return numberInDouble * 3600
            case "Minutes" :
                return numberInDouble * 60
            case "Days":
                return numberInDouble / 24
            default:
                return numberInDouble
            }
        } else {
            switch outputType {
            case "Seconds":
                return numberInDouble * 86400
            case "Minutes" :
                return numberInDouble * 3600
            case "Hours":
                return numberInDouble * 24
            default:
                return numberInDouble
            }
        }
    }
    
    var volumeResult: Double {
        if inputType == "Milliliters" {
            switch outputType {
            case "Liters":
                return numberInDouble / 1000
            case "Cups" :
                return numberInDouble / 236.6
            case "Pints":
                return numberInDouble / 473.2
            case "Gallons":
                return numberInDouble / 3785
            default:
                return numberInDouble
            }
        } else if inputType == "Liters" {
            switch outputType {
            case "Milliters":
                return numberInDouble * 1000
            case "Cups" :
                return numberInDouble * 4.227
            case "Pints":
                return numberInDouble * 2.113
            case "Gallons":
                return numberInDouble / 3.785
            default:
                return numberInDouble
            }
        } else if inputType == "Cups" {
            switch outputType {
            case "Milliters":
                return numberInDouble * 236.6
            case "Liters" :
                return numberInDouble / 4.227
            case "Pints":
                return numberInDouble / 2
            case "Gallons":
                return numberInDouble / 16
            default:
                return numberInDouble
            }
        } else if inputType == "Pints" {
            switch outputType {
            case "Milliters":
                return numberInDouble * 473.2
            case "Liters" :
                return numberInDouble / 2.113
            case "Cups":
                return numberInDouble * 2
            case "Gallons":
                return numberInDouble / 8
            default:
                return numberInDouble
            }
        }
        else {
            switch outputType {
            case "Milliters":
                return numberInDouble * 3785
            case "Liters" :
                return numberInDouble * 3.785
            case "Cups":
                return numberInDouble * 16
            case "Pints":
                return numberInDouble * 8
            default:
                return numberInDouble
            }
        }
    }
    var convertedResult: Double {
        if unitType == "Temperature" {
            return temperatureResult
        } else if unitType == "Length" {
            return lengthResult
        } else if unitType == "Time" {
             return timeResult
        } else {
           return volumeResult
        }
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Selected Type: ", selection: $unitType) {
                    ForEach(unitTypes, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Select Unit type")
            }
            Section {
                Picker("Select \(unitType) (From)", selection: $inputType) {
                    ForEach(selectUnitCatagory, id: \.self) {
                        Text("\($0)")
                    }
                }

                    
            } header: {
                Text("Select from which you want to convert.")
            }
            
            Section {
                Picker("Select \(unitType) (To)", selection: $outputType) {
                    ForEach(selectUnitCatagory, id: \.self) {
                        Text("\($0)")
                    }
                }
            } header: {
                Text("Select what's type convert you want.")
            }
            
            Section {
                TextField("Plese Enter \(unitType)", text: $inputnumber)
            } header: {
                Text("Input \(unitType)")
            }
            
            Section {
                Text("The Converted \(unitType): \(convertedResult)")
            } header: {
                Text("Output \(unitType)")
            }
        }
    }
}

struct TemperatureConversion_Previews: PreviewProvider {
    static var previews: some View {
        ConversionScreen()
    }
}
