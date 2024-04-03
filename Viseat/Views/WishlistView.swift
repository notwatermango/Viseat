//
//  WishlistView.swift
//  Viseat
//
//  Created by robert theo on 03/04/24.
//

import SwiftUI

struct WishlistView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        WishList()
    }
}

#Preview {
    WishlistView().environment(ModelData())

}
