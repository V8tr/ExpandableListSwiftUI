//
//  PlacesList.swift
//  ExpandableListSwiftUI
//
//  Created by Vadim Bulavin on 1/29/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

// Search for places https://www.hackingwithswift.com/example-code/location/how-to-look-up-a-location-with-mklocalsearchrequest
// Place model https://developer.apple.com/documentation/mapkit/mkmapitem

struct PlacesList: View {
    let places: [Place]
    
    var body: some View {
        List(places, id: \.self) { place in
            VStack {
                Text(place.name)
                Text(place.location)
            }
        }
    }
}

struct PlacesList_Previews: PreviewProvider {
    static var previews: some View {
        PlacesList(places: defaultPlaces())
    }
}

struct ExpandableItem<Item>: Identifiable where Item: Identifiable {
    let item: Item
    var id: Item.ID { item.id }
}

struct Place: Hashable {
    let name: String
    let location: String
}

func defaultPlaces() -> [Place] {
    return (0...100).map { Place(name: "P\($0)", location: "\($0)\n\($0)\n\($0)\n\($0)\n\($0)") }
}
