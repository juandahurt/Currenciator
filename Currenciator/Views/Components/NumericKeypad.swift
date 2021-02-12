//
//  NumericKeypad.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct NumericKeypad: View {
    var value: Binding<Int>
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    func numberTouched(number: Int) {
        if value.wrappedValue > 0 {
            let currentNumberStr = String(value.wrappedValue)
            value.wrappedValue = Int(currentNumberStr + String(number))!
        } else {
            value.wrappedValue = number
        }
    }
    
    func clearValue() {
        value.wrappedValue = 0
    }
    
    func delete() {
        var currentNumberStr = String(value.wrappedValue)
        currentNumberStr.removeLast()
        if currentNumberStr.count == 0 {
            value.wrappedValue = 0
        } else {
            value.wrappedValue = Int(currentNumberStr)!
        }
    }
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1..<10) { number in
                Text("\(number)")
                    .padding(.bottom, 30)
                    .onTapGesture {
                        numberTouched(number: number)
                    }
            }
            Text("C")
                .opacity(0.5)
                .onTapGesture {
                    clearValue()
                }
            Text("0")
                .onTapGesture {
                    numberTouched(number: 0)
                }
            Image("Delete")
                .onTapGesture {
                    delete()
                }
        }
        .font(.custom("Poppins-Regular", size: 40))
        .foregroundColor(Color("Black"))
    }
}
