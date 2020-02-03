//
//  Place.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 1/30/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Foundation

struct Place: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let country: String
    let city: String
    let street: String
    let zip: String
    let phoneNumber: String
    
    static func samples() -> [Place] { (0...100).map(Place.fixture) }
    
    private static func fixture(_ id: Int) -> Place {
        Place(
            id: id,
            name: "Place #\(id)",
            country: "Country #\(id)",
            city: "City #\(id)",
            street: "Street #\(id)",
            zip: "Zip #\(id)",
            phoneNumber: "Phone #\(id)"
        )
    }
}
