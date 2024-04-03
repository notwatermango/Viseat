//
//  WishlistButton.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct WishlistButton: View {
    @Binding var isSet: Bool


    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "heart.fill" : "heart").foregroundColor(.danger)
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .red : .gray)
        }
    }
}


#Preview {
    WishlistButton(isSet: .constant(true))
}
