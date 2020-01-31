//
//  View+Ext.swift
//  ExpandableListSwiftUI
//
//  Created by Vadym Bulavin on 1/31/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
