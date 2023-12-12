//
//  ContentView.swift
//  lottie-animations
//
//  Created by AMAR on 12/12/23.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        LottieView(name: "Animation - 1702398486676", loopMode: .playOnce)
            .frame(width: 300, height: 300, alignment: .center)
    }
}



struct LottieView: UIViewRepresentable {
    let name: String
    var loopMode: LottieLoopMode = .loop
    var animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}

#Preview {
    ContentView()
}
