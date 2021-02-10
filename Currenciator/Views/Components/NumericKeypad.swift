//
//  NumericKeypad.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct NumericKeypad: View {
    var value: Binding<Double>
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1..<10) { number in
                Text("\(number)")
                    .padding(.bottom, 30)
            }
            Text(".")
            Text("0")
            Image("Delete")
        }
        .font(.custom("Poppins-Regular", size: 40))
        .foregroundColor(Color("Black"))
    }
}
