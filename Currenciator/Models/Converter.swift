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
    var result: Double = 0.0
    
    mutating func convert(completion: @escaping (ConversionServerResponse) -> Void) {
        var networking = Networking()
        let parameterKey = countryA.currencyId + "_" + countryB.currencyId
        networking.parameters?.updateValue(parameterKey, forKey: "q")
        networking.get("/convert", completion: completion)
    }
}
