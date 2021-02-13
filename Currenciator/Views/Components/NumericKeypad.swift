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
    @State private var numberTouched: Int?
    
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
    
    func numberContainer(number: Int) -> some View {
        let userIsTouchingTheNumber = numberTouched == number
        return ZStack {
            Rectangle()
                .fill(Color("Background"))
                .frame(height: 60)
            Text("\(number)")
        }
        .scaleEffect(userIsTouchingTheNumber ? CGSize(width: 1.2, height: 1.2) : CGSize(width: 1, height: 1))
        .onTapGesture {
            numberTouched = number
            numberTouched(number: number)
            withAnimation(Animation.linear.delay(0.02)) {
                numberTouched = nil
            }
        }
    }
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(1..<10) { number in
                numberContainer(number: number)
            }
            Text("C")
                .opacity(0.2)
                .onTapGesture {
                    clearValue()
                }
            numberContainer(number: 0)
            Image("Delete")
                .onTapGesture {
                    delete()
                }
        }
        .font(.custom("Poppins-Regular", size: 40))
        .foregroundColor(Color("Black"))
    }
}
