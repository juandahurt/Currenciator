//
//  CountryVM.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import Foundation

class CountryVM: ObservableObject {
    @Published var countries: [Country] = []
    
    func listCountries(completion: @escaping () -> Void){
        if countries.isEmpty {
            Country.list { response in
                for key in response.results.keys {
                    self.countries.append(response.results[key]!)
                }
                self.countries.sort(by: { $0.name < $1.name })
                completion()
            }
        } else {
            completion()
        }
    }
}
