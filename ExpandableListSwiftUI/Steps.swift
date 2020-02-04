//
//  Steps.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 2/4/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

enum Step1 {
    struct PlacesListView: View {
        var body: some View {
            EmptyView()
        }
    }
}

enum Step2 {
    struct Place: Identifiable {
        let id: Int
        let name: String
    }
    
    struct PlacesListView: View {
        let places: [Place]
        
        var body: some View {
            EmptyView()
        }
    }
}

enum Step3 {
    static let places = [
        Place(id: 0, name: "Place #0"),
        Place(id: 1, name: "Place #1"),
        Place(id: 2, name: "Place #2")
    ]
    
    struct Place: Identifiable {
        let id: Int
        let name: String
    }
    
    struct PlacesListView: View {
        let places: [Place]
        
        var body: some View {
            List(places) { place in
                Text(place.name)
            }
        }
    }
}

enum Step4 {
    struct PlaceView: View {
        let place: Place
        
        var body: some View {
            Text(place.name)
        }
    }
    
    struct PlacesListView: View {
        let places: [Place]
        
        var body: some View {
            List(places) { place in
                PlaceView(place: place)
                    .onTapGesture { self.selectDeselect(place) }
            }
        }
        
        func selectDeselect(_ place: Place) {
            print("Selected \(place.id)")
        }
    }
}

enum Step5 {
    struct PlaceView: View {
        let place: Place
        
        var body: some View {
            HStack {
                Text(place.name)
                Spacer()
            }
            .contentShape(Rectangle())
        }
    }
    
    struct PlacesListView: View {
        let places: [Place]
        
        var body: some View {
            List(places) { place in
                PlaceView(place: place)
                    .onTapGesture { self.selectDeselect(place) }
            }
        }
        
        func selectDeselect(_ place: Place) {
            print("Selected \(place.id)")
        }
    }
}

enum Step6 {
    struct Place: Identifiable, Hashable {
        let id: Int
        let name: String
    }
    
    struct PlaceView: View {
        let place: Place
        
        var body: some View {
            HStack {
                Text(place.name)
                Spacer()
            }
            .contentShape(Rectangle())
        }
    }
    
    struct PlacesListView: View {
        let places: [Place]
        @State private var selection: Set<Place> = []
        
        var body: some View {
            List(places) { place in
                PlaceView(place: place)
                    .onTapGesture { self.selectDeselect(place) }
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
}

enum Step7 {
    struct PlaceView: View {
        let place: Place
                
        var body: some View {
            HStack {
                content
                Spacer()
            }
            .contentShape(Rectangle())
        }
        
        var content: some View {
            VStack(alignment: .leading) {
                Text(place.name).font(.headline)
                
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
    
    struct PlacesListView: View {
        let places: [Place]
        @State private var selection: Set<Place> = []
        
        var body: some View {
            List(places) { place in
                PlaceView(place: place)
                    .onTapGesture { self.selectDeselect(place) }
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
}

enum Step8 {
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
        
        var content: some View {
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
    
    struct PlacesListView: View {
        let places: [Place]
        @State private var selection: Set<Place> = []
        
        var body: some View {
            List(places) { place in
                PlaceView(place: place, isExpanded: self.selection.contains(place))
                    .onTapGesture { self.selectDeselect(place) }
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
}

enum Step9 {
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
        
        var content: some View {
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
    
    struct PlacesListView: View {
        let places: [Place]
        @State private var selection: Set<Place> = []
        
        var body: some View {
            forEach
            // list
        }
        
        var list: some View {
            List(places) { place in
                PlaceView(place: place, isExpanded: self.selection.contains(place))
                    .onTapGesture { self.selectDeselect(place) }
                    .animation(.linear(duration: 0.3))
            }
        }
        
        var forEach: some View {
            ScrollView {
                ForEach(places) { place in
                    PlaceView(place: place, isExpanded: self.selection.contains(place))
                        .onTapGesture { self.selectDeselect(place) }
                        .modifier(ListRowModifier())
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
}
