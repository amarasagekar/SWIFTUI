//
//  ExpandedView.swift
//  ExpandableView
//
//  Created by AMAR on 15/11/23.
//

import SwiftUI

struct ExpandedView: View {
    var id = UUID()
    @ViewBuilder var content: any View
    
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}

