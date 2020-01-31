//
//  ExpandableItem.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 1/31/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import Foundation

@dynamicMemberLookup
struct ExpandableItem<Item> {
    var item: Item
    var isExpanded = false
    
    subscript<Value>(dynamicMember keyPath: KeyPath<Item, Value>) -> Value {
        item[keyPath: keyPath]
    }
}

extension ExpandableItem: Identifiable where Item: Identifiable {
    var id: Item.ID { item.id }
}

extension ExpandableItem: Equatable where Item: Equatable {}

extension ExpandableItem: Hashable where Item: Hashable {
    func hash(into hasher: inout Hasher) { item.hash(into: &hasher) }
}
