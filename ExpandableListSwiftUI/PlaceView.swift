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
            content
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
    }
    
    var content: some View {
//        place.isExpanded ? expanded.eraseToAnyView() : collapsed.eraseToAnyView()
        VStack {
            Text(place.name)
            
            if place.isExpanded {
                Text(place.location)
            }
        }
    }
    
    var expanded: some View {
        VStack {
            Text(place.name)
            Text(place.location)
        }
    }
    
    var collapsed: some View {
        Text(place.name)
    }
}
