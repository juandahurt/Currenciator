//
//  CurrenciatorApp.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

@main
struct CurrenciatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NetworkConnection())
        }
    }
}
