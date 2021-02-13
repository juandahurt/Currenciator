//
//  Conversion.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import Foundation

struct Conversion: Decodable {
    var id: String
    var val: Double
    var to: String
    var fr: String
}
