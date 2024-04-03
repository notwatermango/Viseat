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
            VStack {
                // Item 1
                HStack {
                    
                    VStack (alignment: .leading) {
                        Text(restaurant.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 24))
                        Text(restaurant.address.street)
                            .fontWeight(.light)
                    }.padding(.leading, 16).padding(.top)
                    
                    Spacer()
                    
                    HStack (alignment: .top){
                        WishlistButton(isSet: $modelData.restaurants[restaurantIndex].isWishlist)
                            .padding(.top, 2)
                        VStack {
                            Image(systemName: "arrow.triangle.turn.up.right.diamond.fill").foregroundColor(.accentColor)
                            // Distance
                            Text("50m")
                                .fontWeight(.medium)
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        }
                    }.padding(.trailing, 16)
                }.padding(.top, 64).padding(.bottom, 12)
                
                // Item 2
                HStack {
                    ForEach(restaurant.cuisineType, id:\.self) { cuisine in
                        Text(cuisine)
                            .padding(10).overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.accentColor, lineWidth: 1)
                            ).foregroundColor(.accentColor).fontWeight(.bold)
                    }
                    Spacer()
                }.padding(.trailing, 16).padding(.leading, 16).padding(.bottom, 12)
                
                // Item 3
                Image(restaurant.menu.bestSeller.image).resizable().padding(.leading, 16).padding(.trailing, 16).frame(height: 180).padding(.bottom, 12)
                
                // Item 4
                HStack {
                    Text("Menu")
                        .padding(.leading, 16)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20))
                    Spacer()
                }.padding(.bottom, 5)
                
                // Item 5
                VStack {
                    ForEach(restaurant.menu.categories, id:\.self) { category in
                        ForEach(category.items, id: \.self) { menuItem in
                                HStack() {
                                    Image(menuItem.name)
                                        .font(.subheadline)
                                        .fontWeight(.bold).padding(.trailing, 6)
                                    Text(menuItem.description)
                                        .foregroundColor(.black)
                                        .fontWeight(.medium)
                                        .font(.system(size: 16))
                                    Spacer()
                                    Text("Rp\(menuItem.price),-")
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .padding(.trailing, 16)
                                }
                            Divider()
                        }
                        .padding(.leading, 16).padding(.top, 1).padding(.bottom, 1)
                    }
                }
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    return RestaurantDetail(restaurant: modelData.restaurants[0]).environment(modelData)
}
