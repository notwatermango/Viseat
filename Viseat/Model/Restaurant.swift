//
//  Restaurant.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Restaurant: Hashable, Codable, Identifiable {
  var id: String = UUID().uuidString
  var name: String
  var cuisineType: [String]
  var priceRange: Int
  var address: Address
  var geolocation: Geolocation
  var isWishlist: Bool
  var isHalal: Bool
  var phoneNumber: String
  var mainImage: String
  var ratings: Double
  var images: [String]
  var openingHours: [String: String]
  var menu: Menu
}

struct Address: Hashable, Codable {
  var street: String
  var city: String
  var province: String
  var kecamatan: String
  var kelurahan: String
}

struct Geolocation: Hashable, Codable {
  var longitude: Double
  var latitude: Double
}

struct Menu: Hashable, Codable {
  var bestSeller: BestSeller
  var categories: [Category]
}

struct BestSeller: Hashable, Codable {
  var name: String
  var description: String
  var price: Int
  var image: String
}

struct Category: Hashable, Codable {
  var name: String
  var items: [MenuItem]
}

struct MenuItem: Hashable, Codable {
  var name: String
  var description: String
  var price: Int
}
