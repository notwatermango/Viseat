//
//  ContentView.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SwipeView().environment(ModelData())
            .tabItem {
                    Label("Explore", systemImage: "safari.fill")
                }
//            Text("Browse")
            RestaurantList().environment(ModelData())
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
            WishList().environment(ModelData())
                .tabItem {
                    Label("Wishlist", systemImage: "heart")
                        .environment(\.symbolVariants, .none)
                }
        }
    }
}

#Preview {
    ContentView()
}
