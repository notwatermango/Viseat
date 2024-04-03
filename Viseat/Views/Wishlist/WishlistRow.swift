//
//  WishlistRow.swift
//  Viseat
//
//  Created by robert theo on 03/04/24.
//

import SwiftUI

struct WishlistRow: View {
    let restaurant:Restaurant

    var body: some View {
        ZStack {
            Image(restaurant.mainImage)
                .resizable()
                .scaledToFill()
                .frame(width: 174, height: 173)
                .clipped()

            VStack(alignment: .center) {
                Spacer()
                HStack(){
                Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    .padding(10)
                    .background(Circle().fill(.white))
                }
                HStack{
                    Spacer()
                    Text(restaurant.name).font(
                        Font.custom("SF Pro", size: 12)
                        .weight(.medium)
                    )
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    Spacer()
                }
                .foregroundColor(.clear)
                .frame(width: 173, height: 48)
                .background(Color(red: 0.52, green: 0.16, blue: 0.17).opacity(0.6))
            }
        }
        .frame(width: 174, height: 173)
        .background()
        .cornerRadius(8)
        .shadow(radius: 10)
    }
}

#Preview {
    let restaurants = ModelData().restaurants
    return WishlistRow(restaurant: restaurants[0])
}
