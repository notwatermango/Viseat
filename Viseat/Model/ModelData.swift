//
//  ModelData.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import Foundation


@Observable
class ModelData {
    var restaurants: [Restaurant] = load("restaurantData.json")
    var cards: [Card] = []
    
    init() {
        for restaurant in restaurants {
            cards.append(Card(x: 0.0, y: 0.0, degree: 0.0, restaurant: restaurant))
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
