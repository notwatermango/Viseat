//
//  RestaurantList.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct RestaurantList: View {
    @Environment(ModelData.self) var modelData
    @State private var applyFilter = false
    var filteredRestaurant: [Restaurant] {
        modelData.restaurants.filter { restaurant in
            (!applyFilter)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredRestaurant) { restaurant in
                    NavigationLink {
                        RestaurantDetail(restaurant: restaurant)
                    } label: {
                        RestaurantRow(restaurant: restaurant)
                    }
                }
            }
        }
    }
}

#Preview {
    RestaurantList()
        .environment(ModelData())
}
