//
//  Networking.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import Foundation
import Alamofire

struct Networking {
    var baseUrl: String = "https://free.currconv.com/api/v7"
    var apiKey: String = "8642d77acda8d034275a"
    
    var parameters: Parameters?
    
    init() {
        parameters = ["apiKey": self.apiKey]
    }
    
    func get<T: Decodable>(_ endpoint: String, completion: @escaping (T) -> Void) {
        let request = AF.request(baseUrl + endpoint, parameters: parameters)
        request.responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data)
                break
            case .failure(let error):
                debugPrint(error)
                break
            }
        }
    }
}
