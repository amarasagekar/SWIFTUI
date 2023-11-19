//
//  ParticleViews.swift
//  GradientCardDesign
//
//  Created by AMAR on 19/11/23.
//

import Foundation
import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var postion: CGPoint
    let size: CGFloat
    let color: Color
}

struct ParticleView: View {
    let particle: Particle
    @State private var scale: CGFloat = 1
    @State private var opacity: Double = 1
    
    var body: some View{
        Circle()
            .fill(particle.color)
            .frame(width: particle.size, height: particle.size)
            .scaleEffect(scale)
            .position(particle.postion)
            .opacity(opacity)
            .onAppear{
                withAnimation {
                    scale = 0
                    opacity = 0
                }
            }
    }
}

struct ParticleEmitterView: View {
    @Binding var particles: [Particle]
    
    var body: some View{
        ZStack{
            ForEach(particles) { particle in
                ParticleView(particle: particle)
            }
        }
    }
}

struct BlurCardView: View {
    @State var cardOffset: CGSize = .zero
    @State var previousCardOffset: CGSize = .zero
    @State var particles: [Particle] = []
    @State var  dragging : Bool = false
    private let cardTitle: String = "Debit Card"
    private let cardHolderName: String = "**** 1111"
    
    let cardWidth: CGFloat = 360
    let cardHeight: CGFloat = 240
    
    var body: some View{
        RoundedRectangle(cornerRadius: 30)
            .fill(LinearGradient(colors: [.white.opacity(0.2), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: cardWidth, height: cardHeight)
            .overlay(
                VStack(alignment: .leading, spacing: 100){
                    Text(cardTitle)
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom){
                        Text("Valid Thru 09/23")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                            .foregroundStyle(.white)
                    }
                }
                    .padding()
            )
            .overlay(
                ZStack{
                    RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors:[.white.opacity(0.6), .clear, .white.opacity(0.3)],startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                    RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors:[.white.opacity(0.4), .clear, .white.opacity(0.3)],startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 20).blur(radius: 30)
                    
                    RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors:[Color.indigo, Color.indigo.opacity(0.6)],startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 20).blur(radius: 50)
                    
                    RoundedRectangle(cornerRadius: 30).stroke(.linearGradient(colors:[Color.indigo, Color.blue, Color.indigo, Color.cyan, Color.cyan.opacity(0.6)],startPoint: .topLeading, endPoint: .bottomTrailing)).blendMode(.colorDodge)
                }
            )
            .offset(cardOffset)
            .overlay(ParticleEmitterView(particles: $particles).blendMode(.colorDodge))
            .scaleEffect(dragging ? 1.1 : 1)
            .animation(.easeInOut, value: dragging)
            .rotation3DEffect(
                .degrees(cardOffset != .zero ? 10 : 0),
                axis: (x: -cardOffset.height * 0.1, y: cardOffset.width * 0.1, z:0))
        
            .gesture(
            DragGesture()
                .onChanged{ value in
                    dragging = true
                    let newPostion = CGSize(width: value.translation.width + previousCardOffset.width, height:  value.translation.height + previousCardOffset.height)
                    
                    let delta = CGSize(width: newPostion.width - cardOffset.width, height: newPostion.height - cardOffset.height)
                    cardOffset = newPostion
//                    emitParticles(delta: delta)
                }
                .onEnded{ _ in
                    withAnimation(.spring()){
                        cardOffset = .zero
                        previousCardOffset = .zero
                    }
                    dragging = false
                }
            
            )
            
    }
    
}

#Preview{
    BlurCardView()
}
