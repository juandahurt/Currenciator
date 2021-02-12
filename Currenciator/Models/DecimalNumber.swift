//
//  DecimalNumber.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import Foundation

@propertyWrapper
class DecimalNumber {
    private var value: Double
    private var decimals: Int
    var wrappedValue: Double {
        get {
            let number = NSNumber(value: value)
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = decimals
            return Double(formatter.string(from: number)!)!
        }
        set {
            value = newValue
        }
    }
    
    init(decimals: Int = 2) {
        self.value = 0.0
        self.decimals = decimals
    }
}
