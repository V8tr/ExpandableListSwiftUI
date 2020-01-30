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

//let store =

struct PlacesList: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        List(store.state.places, id: \.self) { place in
            PlaceView(place: place)
                .onTapGesture { self.store.send(.select(place)) }
                .border(Color.black)
        }
    }
}

struct PlaceView: View {
    let place: Place
    
    var content: some View {
        VStack {
            Text(place.name)
                .border(Color.green)
            Text(place.location)
                .border(Color.yellow)
        }
    }
    
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
        .border(Color.blue)
    }
}

struct PlacesList_Previews: PreviewProvider {
    static var previews: some View {
        PlacesList().environmentObject(PlacesList.Store())
    }
}
