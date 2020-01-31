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
    let location: String
    
    static func samples() -> [Place] {
        return (0...100).map { Place(id: $0, name: "P\($0)", location: "\($0)\n\($0)\n\($0)\n\($0)\n\($0)") }
    }
    
    static func single() -> [Place] {
        return [Place(id: 0, name: "P0", location: "L0\nL0\nL0\nL0\nL0\nL0\nL0\nL0\nL0\n")]
    }
}
