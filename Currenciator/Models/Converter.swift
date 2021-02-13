//
//  Converter.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import Foundation

struct Converter {
    var countryA: Country = .us
    var countryB: Country = .uk
    var value: Int = 0
    @DecimalNumber var result
    
    mutating func convert(completion: @escaping (ConversionServerResponse) -> Void) {
        var networking = Networking()
        let parameterKey = countryA.currencyId + "_" + countryB.currencyId
        networking.parameters?.updateValue(parameterKey, forKey: "q")
        networking.get("/convert", completion: completion)
    }
    
    mutating func updateCountryA(newValue: Country) {
        countryA = newValue
    }
    
    mutating func updateCountryB(newValue: Country) {
        countryB = newValue
    }
    
    mutating func updateValue(newValue: Int) {
        value = newValue
    }
    
    mutating func updateResult(newValue: Double) {
        result = newValue
    }
    
    mutating func switchCountries() {
        let aux = countryA
        countryA = countryB
        countryB = aux
        value = 0
        result = 0
    }
}
