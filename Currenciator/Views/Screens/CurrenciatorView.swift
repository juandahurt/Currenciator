//
//  CurrenciatorView.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct CurrenciatorView: View {
    var background: some View {
        VStack {
            Rectangle()
                .fill(Color("Blue"))
                .frame(height: 211)
            Spacer()
        }
        .background(Color("Background"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var body: some View {
        ZStack {
            background
            VStack {
                RoundedContainer() {
                    Text("Holi")
                }.padding(.bottom, 30)
                NumericKeypad()
                Spacer()
            }
        }
    }
}
