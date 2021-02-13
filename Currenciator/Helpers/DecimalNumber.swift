//
//  DecimalNumber.swift
//  Currenciator
//
//  Created by juandahurt on 13/02/21.
//

import Foundation

@propertyWrapper struct DecimalNumber {
    private var value: Double
    private var decimals: Int
    var wrappedValue: Double {
        get {
            let number = NSNumber(value: value)
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = decimals
            var str = formatter.string(from: number)!
            str = str.replacingOccurrences(of: ",", with: ".")
            return Double(str)!
        }
        set {
            value = newValue
        }
    }
    
    init(decimals: Int = 4) {
        self.value = 0.0
        self.decimals = decimals
    }
}
