//
//  Tab.swift
//  MapsBottomSheet
//
//  Created by AMAR on 03/03/24.
//

import SwiftUI
///Tab
enum Tab: String, CaseIterable{
    case people =  "People"
    case devices = "Devices"
    case items = "Items"
    case me = "Me"
    
    var symbol: String {
        switch self {
        case .people:
            "figure.2.arms.open"
        case .devices:
            "macbook.and.iphone"
        case .items:
            "circle.grid.2x2.fill"
        case .me:
            "person.circle.fill"
        }
    }
}
