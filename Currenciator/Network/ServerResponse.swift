//
//  ServerResponse.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import Foundation

struct CountryServerResponse: Decodable {
    var results: [String: Country]
}

struct ConversionServerResponse: Decodable {
    var results: [String: Conversion]
}
