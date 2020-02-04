//
//  PlaceView.swift
//  ExpandableListSwiftUI
//
//  Created by Vadim Bulavin on 1/31/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

struct PlaceView: View {
    let place: Place
    let isExpanded: Bool
    
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            Text(place.name).font(.headline)
            
            if isExpanded {
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
