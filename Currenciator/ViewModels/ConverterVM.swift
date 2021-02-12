//
//  ConverterStore.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import Foundation

class ConverterVM: ObservableObject {
    @Published private(set) var converter: Converter
//    @DecimalNumber var 
    
    init(converter: Converter) {
        self.converter = converter
    }
    
    var value: Int {
        converter.value
    }
    
    var result: Double {
        converter.result
    }
    
    func updateValue(newValue: Int) {
        converter.value = newValue
    }
    
    func convert(completion: @escaping () -> Void) {
        converter.convert(completion: completion)
    }
}
