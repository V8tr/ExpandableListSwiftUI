//
//  PlaceView.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 1/31/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct PlaceView: View {
    let place: ExpandableItem<Place>
            
    var body: some View {
        HStack {
            Text(place.name)
            Spacer()
        }
        .contentShape(Rectangle())
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            Text(place.name).font(.headline)
            
            if place.isExpanded {
                VStack(alignment: .leading) {
                    Text(place.country)
                    Text(place.city)
                    Text(place.street)
                    Text(place.zip)
                    Text(place.phoneNumber)
                }
            }
        }
    }
}
