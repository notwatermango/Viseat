//
//  RestaurantSwite.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct RestaurantSwipe: View {
    @Environment(ModelData.self) var modelData
    var body: some View {
        VStack {
            ZStack {
                ForEach(ModelData().cards.reversed()) { card in
                    RestaurantSwipeCard(card: card)
                }
            }
        }
    }
}

#Preview {
    return RestaurantSwipe().environment(ModelData())
}
