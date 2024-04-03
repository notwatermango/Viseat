//
//  SwipeView.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

struct SwipeView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        RestaurantSwipe()
    }
}

#Preview {
    SwipeView().environment(ModelData())
}
