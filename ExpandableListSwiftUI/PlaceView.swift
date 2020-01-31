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
    
    static var count = 0
        
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
        .background(Color.yellow)
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Text(place.name)
            
            if place.isExpanded {
                Text(place.location).transition(.identity)
            }
        }
    }
}
