//
//  ContextModifier.swift
//  CompositionalLayout
//
//  Created by Immortal Lion on 29/02/24.
//

import SwiftUI

struct ContextModifier: ViewModifier {
    var card: Card
    
    func body(content: Content) -> some View {
        content
            .contextMenu(ContextMenu(menuItems: {
                Text("By \(card.author)")

            }))
            .contentShape(RoundedRectangle(cornerRadius: 5))
            
    }
}

