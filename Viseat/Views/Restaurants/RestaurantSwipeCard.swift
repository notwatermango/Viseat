//
//  RestaurantSwipeCard.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

// TODO: styling

struct RestaurantSwipeCard: View {
    @State var card: Card
    @Environment(ModelData.self) var modelData
    
    var restaurantIndex: Int {
        modelData.restaurants.firstIndex(where: {
            $0.id == card.restaurant.id
        })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ZStack(alignment: .topLeading) {
            Image(card.restaurant.mainImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 1.0)
                .zIndex(-1)
            VStack(alignment: .leading) {
                Spacer()
                Text(card.restaurant.name)
                HStack {
                    Image(systemName: "star.fill")
                    Text(String(format: "%0.1f/5.0", card.restaurant.ratings))
                }
                HStack {
                    Image(systemName: "info.circle.fill")
                    Text(String(format: "%dm from you", 150))
                }
                
            }
            .padding()
            .foregroundColor(.white)
            
            HStack {
                Text("Like").font(.title)
                    .opacity(Double(card.x))
                    .foregroundColor(.green)
                Spacer()
                Text("Skip").font(.title)
                    .opacity(Double(card.x * -1))
                    .foregroundColor(.red)
            }
            .padding()
            .foregroundColor(.white)
        }
        .cornerRadius(20)
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation(.default) {
                        card.setX(x: value.translation.width)
                        card.setY(y: value.translation.height)
                        card.setDegree(degree: 7 * (value.translation.width > 0 ? 1: -1))
                    }
                }
                .onEnded { value in
                    withAnimation(.interpolatingSpring(mass:1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            card.setX(x: 0)
                            card.setY(y: 0)
                            card.setDegree(degree: 0)
                        case let x where x > 100:
                            modelData.restaurants[restaurantIndex].isWishlist = true
                            card.setX(x: 2000)
                            card.setDegree(degree: 12)
                            // Like
                            print("Like \(modelData.restaurants[restaurantIndex].name)")
                        case (-100)...(-1):
                            card.setX(x: 0)
                            card.setY(y: 0)
                            card.setDegree(degree: 0)
                        case let x where x < -100:
                            card.setX(x: -2000)
                            card.setDegree(degree: -12)
                            // Skip
                            print("Skip")
                        default:
                            card.setX(x: 0)
                            card.setY(y: 0)
                        }
                    }
                }
        )
        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
    }
    
    
    
    
}


#Preview {
    let modelData = ModelData()
    return RestaurantSwipeCard(card: modelData.cards[0]).environment(modelData)
}
