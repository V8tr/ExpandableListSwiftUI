//
//  ContentView.swift
//  ExpandableListSwiftUI
//
//  Created by Vadim Bulavin on 1/29/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

let store = Store()

struct ContentView: View {
    var body: some View {
        PlacesListView()
            .environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
