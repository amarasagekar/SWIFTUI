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

        Canvas{ ctx, size in
            ctx.addFilter(.alphaThreshold(min: 0.4, color: config.foregroundColor))
            
            if let renderdImage = ctx.resolveSymbol(id: 0){
                ctx.draw(renderdImage, at: CGPoint(x: size.width / 2, y: size.height / 2))
            }
        } symbols: {
            ImageView()
                .tag(0)
        }
        .frame(width: config.frame.width, height: config.frame.height)
    }
    
    @ViewBuilder
    func ImageView() -> some View{
        Image(systemName: symbole)
            .font(config.font)
            .blur(radius: 10)
            .frame(width: config.frame.width, height: config.frame.height)
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

