//
//  Country.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import Foundation

struct Country: Decodable, Identifiable {
    var id: String
    var name: String
    var currencyId: String
    
    static func list(completion: @escaping ((CountryServerResponse) -> Void)) {
        Networking().get("/countries", completion: completion)
    }
}

extension Country {
    static func handleFlagImageName(of country: Country) -> String {
        // Existen algunas banderas cuyo nombre de archivo es muy diferente a los nombres
        // de los paises que vienen desde la api.
        return country.name.lowercased().replacingOccurrences(of: " ", with: "-")
        // Ahora, el problema es que hay algunas que no están o que el nombre es muuuy diferente.
    }
}
