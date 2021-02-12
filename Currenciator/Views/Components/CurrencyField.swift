//
//  CurrencyField.swift
//  Currenciator
//
//  Created by juandahurt on 10/02/21.
//

import SwiftUI

struct CurrencyField: View {
    var text: String
    var isEditable: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Background"))
                .frame(maxHeight: 50)
            RoundedRectangle(cornerRadius: 10)
                .stroke(isEditable ? Color("Blue") : Color.clear, lineWidth: 2)
                .frame(maxHeight: 50)
            Text(text)
                .foregroundColor(Color("Black"))
                .font(.custom("Poppins-SemiBold", size: 20))
        }
    }
}
