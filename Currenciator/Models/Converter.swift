//
//  Converter.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import Foundation

struct Converter {
    var currencyA: Currency
    var currencyB: Currency
    var value: Int = 0
    var result: Double = 0.0
    
    mutating func convert(completion: @escaping () -> Void) {
        result = 100.0
        completion()
    }
}
