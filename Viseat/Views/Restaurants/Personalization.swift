//
//  Personalization.swift
//  Viseat
//
//  Created by Michael Varian Kostaman on 03/04/24.
//

import SwiftUI

struct Personalization: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("Choose your preferences to know your detail")
                            .font(.system(size: 12))
                            .fontWeight(.light)
                        Spacer()
                    }.padding(.leading, 16).padding(.bottom, 30)
                    
                    HStack {
                        Text("Distance")
                        
                    }
                }
            }
            .navigationBarTitle("Personalization")
        }
    }
}

#Preview {
    Personalization()
}
