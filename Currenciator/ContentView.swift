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
                CurrenciatorView(
                    converterVM: ConverterVM(
                        converter: Converter()
                    )
                )
            } else {
                NetworkErrorView()
            }
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}
