//
//  ContentView.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RestaurantList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
