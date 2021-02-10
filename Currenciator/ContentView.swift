//
//  ContentView.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

import Network

struct ContentView: View {
    @EnvironmentObject private var networkConnection: NetworkConnection
    
    var body: some View {
        Group {
            if networkConnection.isConnected {
                CurrenciatorView()
            } else {
                NetworkErrorView()
            }
        }
    }
}
