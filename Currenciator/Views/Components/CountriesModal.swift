//
//  CountriesModal.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import SwiftUI

struct CountriesModal: View {
    var isPresented: Binding<Bool>
    var onSelectedCountry: (Country) -> Void
    @State var isLoading = true
    @StateObject var countryVM: CountryVM = CountryVM()
    
    func row(for country: Country) -> some View {
        VStack {
            HStack {
                Image(Country.handleFlagImageName(of: country))
                    .resizable()
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                Text(country.name)
                    .font(.custom("Poppins-SemiBold", size: 14))
                    .foregroundColor(Color("Black"))
                Spacer()
            }
            Divider()
        }.onTapGesture {
            onSelectedCountry(country)
            isPresented.wrappedValue = false
        }
    }
    
    var background: some View {
        Rectangle()
            .fill(Color.black.opacity(0.5))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                isPresented.wrappedValue = false
            }
    }
    
    var countriesContainer: some View {
        VStack {
            Text("Choose a country")
                .font(.custom("Poppins-SemiBold", size: 16))
                .padding()
            ScrollView {
                LazyVStack {
                    Group {
                        if isLoading {
                            ProgressView()
                        } else {
                            ForEach(countryVM.countries) { country in
                                row(for: country)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .padding(40)
    }
    
    @ViewBuilder var body: some View {
        if isPresented.wrappedValue {
            ZStack {
                background
                countriesContainer
            }
            .onAppear {
                isLoading = true
                countryVM.listCountries {
                    isLoading = false
                }
            }
        } else {
            EmptyView()
        }
    }
}
