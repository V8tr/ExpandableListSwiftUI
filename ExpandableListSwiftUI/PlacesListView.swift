//
//  PlacesListView.swift
//  ExpandableListSwiftUI
//
//  Created by Vadim Bulavin on 1/29/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

// Search for places https://www.hackingwithswift.com/example-code/location/how-to-look-up-a-location-with-mklocalsearchrequest
// Place model https://developer.apple.com/documentation/mapkit/mkmapitem

struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }.offset(x: 20)
    }
}

struct PlacesListView: View {
    @State private var selection: Set<Place> = []
    let places: [Place]
    
    private var items: [ExpandableItem<Place>] {
        places.map { ExpandableItem(item: $0, isExpanded: selection.contains($0)) }
    }
    
    var body: some View {
        scrollForEach
//            list
    }
    
    var list: some View {
        List(items) { place in
            PlaceView(place: place)
                .onTapGesture { self.selectDeselect(place.item) }
                .animation(.linear(duration: 0.3))
        }
    }
    
    var scrollForEach: some View {
        ScrollView {
            ForEach(items) { place in
                PlaceView(place: place)
                    .modifier(ListRowModifier())
                    .onTapGesture { self.selectDeselect(place.item) }
                    .animation(.linear(duration: 0.3))
            }
        }
    }
    
    private func selectDeselect(_ place: Place) {
        if selection.contains(place) {
            selection.remove(place)
        } else {
            selection.insert(place)
        }
    }
}

struct PlacesList_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView(places: Place.samples())
    }
}
