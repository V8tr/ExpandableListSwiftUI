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
        content.padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
    }
}

struct PlacesListView: View {
    @EnvironmentObject var store: Store
    
    var places: [ExpandableItem<Place>] {
        store.state.places.map { ExpandableItem(item: $0, isExpanded: store.state.selection.contains($0)) }
    }
    
    var body: some View {
        ScrollView {
            ForEach(places) { place in
                PlaceView(place: place)
                .modifier(ListRowModifier())
                .border(Color.black.opacity(0.3))
                .onTapGesture { self.store.send(.select(place.item)) }
                .animation(.linear(duration: 0.3))
            }
        }
    }
}

struct PlacesList_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView().environmentObject(Store())
    }
}
