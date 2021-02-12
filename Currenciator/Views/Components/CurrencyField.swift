//
//  CurrencyField.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import SwiftUI

struct CurrencyField: View {
    var text: String
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColor)
                .frame(maxHeight: 50)
            Text(text)
                .foregroundColor(Color("Black"))
                .font(.custom("Poppins-SemiBold", size: 20))
        }
    }
}
