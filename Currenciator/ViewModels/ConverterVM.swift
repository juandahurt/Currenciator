//
//  ConverterStore.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import Foundation

class ConverterVM: ObservableObject {
    @Published private(set) var converter: Converter
    
    init(converter: Converter) {
        self.converter = converter
    }
    
    var countryA: Country? {
        converter.countryA
    }
    
    var countryB: Country? {
        converter.countryB
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
    
    func updateCountryA(newValue: Country) {
        converter.countryA = newValue
    }
    
    func updateCountryB(newValue: Country) {
        converter.countryB = newValue
    }
    
    func convert(completion: @escaping () -> Void) {
        converter.convert { response in
            let key = self.countryA!.currencyId + "_" + self.countryB!.currencyId
            let rate = response.results[key]!.val
            self.converter.result = Double(self.converter.value) * rate
            completion()
        }
    }
}
