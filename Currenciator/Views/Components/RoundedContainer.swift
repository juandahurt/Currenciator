//
//  RoundedContainer.swift
//  Currenciator
//
//  Created by juandahurt on 9/02/21.
//

import SwiftUI

struct RoundedContainer<Content>: View where Content: View {
    var content: Content
    
    init(content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(maxHeight: 221)
                .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
            content
                .padding(20)
        }
        .padding(.top, 72)
        .padding(.horizontal, 20)
    }
}
