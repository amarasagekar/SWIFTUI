//
//  MorphingSymboleView.swift
//  Walkthrough+Morphing
//
//  Created by Immortal Lion on 19/08/24.
//

import SwiftUI

/// Custom Symbole Morphing view
struct MorphingSymboleView: View {
    var symbole: String
    var config: Config
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    struct Config{
        var font: Font
        var frame: CGSize
        var radius: CGFloat
        var foregroundColor: Color
    }
}

#Preview {
    MorphingSymboleView(symbole: "gearshape.fill", config: .init(font: .system(size: 100, weight: .bold), frame: CGSize(width: 250, height: 200), radius: 15, foregroundColor: .black))
}
