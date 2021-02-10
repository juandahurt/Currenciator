//
//  NetworkErrorView.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct NetworkErrorView: View {
    var body: some View {
        VStack {
            Image("Error")
            VStack {
                Text("Oops!")
                    .font(.custom("Poppins-SemiBold", size: 22))
                Text("Looks like you’re not connected to the internet.")
                    .multilineTextAlignment(.center)
                    .font(.custom("Poppins-Regular", size: 18))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Blue"))
    }
}
