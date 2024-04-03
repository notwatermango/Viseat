//
//  ViseatApp.swift
//  Viseat
//
//  Created by mg0 on 02/04/24.
//

import SwiftUI

@main
struct ViseatApp: App {
    var body: some Scene {
        WindowGroup {
            SwipeView().environment(ModelData())
        }
    }
}
