//
//  AppState.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 1/30/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Combine

// Mecid's Recipes app https://github.com/mecid/swiftui-recipes-app

struct ExpandableItem<Item>: Identifiable where Item: Identifiable {
    let item: Item
    var id: Item.ID { item.id }
}

extension PlacesList {
    
    struct State: Equatable {
        var places = Place.samples()
        var selection = Set<Place>()
    }
    
    enum Action {
        case select(Place)
    }
    
    class Store: ObservableObject {
        @Published private(set) var state = State()
        
        func send(_ action: Action) {
            switch action {
            case .select(let place):
                if state.selection.contains(place) {
                    state.selection.remove(place)
                } else {
                    state.selection.insert(place)
                }
            }
        }
    }
}
