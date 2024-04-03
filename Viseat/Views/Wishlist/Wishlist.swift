//
//  Wishlist.swift
//  Viseat
//
//  Created by robert theo on 03/04/24.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

struct WishList: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 12) {
                ForEach(modelData.restaurants) { restaurant in
                    WishlistRow(restaurant: restaurant)
                }
            }
            .padding()
        }
    }
}

#Preview {
    WishList()
        .environment(ModelData())
}
