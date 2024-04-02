//
//  RestaurantDetail.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct RestaurantDetail: View {
    @Environment(ModelData.self) var modelData
    
    var restaurant: Restaurant
    
    var restaurantIndex: Int {
        modelData.restaurants.firstIndex(where: { $0.id == restaurant.id })!
    }
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            HStack {
                Text(restaurant.name)
                Spacer()
                WishlistButton(isSet: $modelData.restaurants[restaurantIndex].isWishlist)
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    return RestaurantDetail(restaurant: modelData.restaurants[0]).environment(modelData)
}
