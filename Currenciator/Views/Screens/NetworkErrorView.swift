//
//  NetworkErrorView.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct NetworkErrorView: View {
    var bottomMessage: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 70)
            Text("Please, check your network status.")
                .font(.custom("Poppins-Regular", size: 16))
                .foregroundColor(Color("Black").opacity(0.5))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image("Error")
            Text("Oops!")
                .font(.custom("Poppins-SemiBold", size: 22))
                .foregroundColor(.white)
            Text("Looks like you’re not connected to the internet.")
                .multilineTextAlignment(.center)
                .font(.custom("Poppins-Regular", size: 18))
                .foregroundColor(.white)
            Spacer()
            bottomMessage
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Blue"))
    }
}
