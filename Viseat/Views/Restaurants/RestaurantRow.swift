//
//  RestaurantRow.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct RestaurantRow: View {
    var restaurant: Restaurant
    var body: some View {
        HStack {
            Text(restaurant.name)
        }
    }
}

#Preview {
    let restaurants = ModelData().restaurants
    return RestaurantRow(restaurant: restaurants[0])
}

