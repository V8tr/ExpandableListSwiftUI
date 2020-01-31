//
//  Store.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 1/30/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Foundation
import Combine

// Mecid's Recipes app https://github.com/mecid/swiftui-recipes-app

struct State: Equatable {
    var places: [Place] = []
    var selection = Set<Place>()
}

enum Action {
    case select(Place)
    case fetch
}

class Store: ObservableObject {
    @Published private(set) var state = State()
    
    func send(_ action: Action) {
        switch action {
        case .fetch:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.state.places = Place.samples()
            }
            
        case .select(let place):
            if state.selection.contains(place) {
                state.selection.remove(place)
            } else {
                state.selection.insert(place)
            }
        }
    }
}
