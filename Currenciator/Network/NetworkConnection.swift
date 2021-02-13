//
//  NetworkConnection.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import Foundation
import Network

class NetworkConnection: ObservableObject {
    private var monitor: NWPathMonitor = NWPathMonitor()
    var isConnected: Bool = true
    
    init() {
        monitor.pathUpdateHandler = updateNetworkConnection
        monitor.start(queue: .main)
    }
    
    func updateNetworkConnection(path: NWPath) {
        self.objectWillChange.send()
        if path.status == .satisfied {
            debugPrint("connnected.")
            isConnected = true
        } else {
            debugPrint("no connection.")
            isConnected = false
        }
    }
}
