//
//  CurrenciatorView.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

enum CountrySelected {
    case first, second, none
}

struct CurrenciatorView: View {
    @StateObject var converterVM: ConverterVM
    @State private var value: Int = 0
    @State private var showModal = false
    @State private var isConverting = false
    @State var countrySelected: CountrySelected = .none
    
    var helpMessage: some View {
        Text("To change a country, just tap on the one you want to change.")
            .foregroundColor(.white)
            .font(.custom("Poppins-Regular", size: 12))
            .multilineTextAlignment(.center)
    }
    
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
                HStack {
                    VStack(spacing: 35) {
                        HStack(spacing: 20) {
                            Image(converterVM.countryA == nil ? "united-states-of-america" : Country.handleFlagImageName(of: converterVM.countryA!))
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .onTapGesture {
                                    showModal = true
                                    countrySelected = .first
                                }
                            CurrencyField(text: "\(converterVM.value) \(converterVM.countryA!.currencyId)", backgroundColor: Color("Background"))
                        }
                        HStack(spacing: 20) {
                            Image(converterVM.countryB == nil ? "united-kingdom" : Country.handleFlagImageName(of: converterVM.countryB!))
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .onTapGesture {
                                    showModal = true
                                    countrySelected = .second
                                }
                            ZStack {
                                Group {
                                    if isConverting {
                                        CurrencyField(text: "", backgroundColor: .white)
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: Color("Blue")))
                                    } else {
                                        CurrencyField(text: "\(converterVM.result) \(converterVM.countryB!.currencyId)", backgroundColor: .white)
                                    }
                               }
                            }
                        }
                    }
                    Image("Switch")
                        .padding(.leading)
                }
            }
            convertButton
                .offset(x: 0, y: 221 / 2)
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
            isConverting = true
            converterVM.convert() {
                isConverting = false
            }
        }
    }
    
    var body: some View {
        ZStack {
            background
            VStack {
                helpMessage
                    .padding(.top)
                    .padding(.horizontal, 40)
                currenciesContainer
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                NumericKeypad(value: $value)
                    .onChange(of: value) { value in
                        converterVM.updateValue(newValue: value)
                    }
                Spacer()
            }
            CountriesModal(isPresented: $showModal, onSelectedCountry: { country in
                switch countrySelected {
                case .first:
                    converterVM.updateCountryA(newValue: country)
                    break
                case .second:
                    converterVM.updateCountryB(newValue: country)
                    break
                case .none:
                    break
                }
            })
        }
    }
}
