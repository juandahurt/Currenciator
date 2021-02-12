//
//  CountriesModal.swift
//  Currenciator
//
//  Created by juandahurt on 12/02/21.
//

import SwiftUI

struct CountriesModal: View {
    var isPresented: Binding<Bool>
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
                Spacer()
            }
            Divider()
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
                .padding(20)
                .frame(maxWidth: .infinity)
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
