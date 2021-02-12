//
//  CurrenciatorView.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct CurrenciatorView: View {
    @StateObject var converterVM: ConverterVM
    @State private var value: Int = 0
    
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
    
    var currenciesContainer: some View {
        ZStack {
            RoundedContainer() {
                VStack {
                    HStack(spacing: 20) {
                        Image("co")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        CurrencyField(text: "\(converterVM.value)", isEditable: true)
                    }
                    HStack(spacing: 20) {
                        Image("us")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        CurrencyField(text: "\(converterVM.result)", isEditable: false)
                    }
                }
            }
            convertButton
                .offset(x: 0, y: 221 / 2 + 50 / 2)
        }
    }
    
    var convertButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Green"))
                .frame(width: 100, height: 50)
            Text("CONVERT")
                .foregroundColor(.white)
                .font(.custom("Poppins-SemiBold", size: 16))
        }
        .onTapGesture {
            converterVM.convert() {
                
            }
        }
    }
    
    var body: some View {
        ZStack {
            background
            VStack {
                currenciesContainer
                    .padding(.bottom, 40)
                NumericKeypad(value: $value)
                    .onChange(of: value) { value in
                        converterVM.updateValue(newValue: value)
                    }
                Spacer()
            }
        }
    }
}
