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
    /// View properties
    @State private var trigger: Bool = false
    @State private var displayingSymbol: String = ""
    @State private var nextSymbol: String = ""
    
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
        .onChange(of: symbole) { oldValue, newValue in
            trigger.toggle()
            nextSymbol = newValue
        }
        .task {
            guard displayingSymbol == "" else { return }
            displayingSymbol == "" ? symbole: displayingSymbol
        }
    }
    
    @ViewBuilder
    func ImageView() -> some View{
        KeyframeAnimator(initialValue: CGFloat.zero, trigger: trigger) { radius in
         
            Image(systemName: symbole)
                .font(config.font)
                .blur(radius: radius)
                .frame(width: config.frame.width, height: config.frame.height)
                .onChange(of: radius) { oldValue, newValue in
                    if newValue.rounded() == config.radius {
                        /// Animating symbole change
                        
                    }
                }
            
        } keyframes: { _ in
            CubicKeyframe(config.radius, duration: config.keyFrameDuration)
            CubicKeyframe(0, duration: config.keyFrameDuration)
        }
    }
    
    struct Config{
        var font: Font
        var frame: CGSize
        var radius: CGFloat
        var foregroundColor: Color
        var keyFrameDuration: CGFloat = 0.4
        var symbolAnimation: Animation = .smooth(duration: 0.5, extraBounce: 0)
    }
}

#Preview {
    MorphingSymboleView(symbole: "gearshape.fill", config: .init(font: .system(size: 100, weight: .bold), frame: CGSize(width: 250, height: 200), radius: 15, foregroundColor: .black))
}

