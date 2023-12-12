//
//  ViewController.swift
//  lottie-animations
//
//  Created by AMAR on 12/12/23.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    private var animationView: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimationView()
    }

    func setupAnimationView() {
        animationView = .init(name: "Animation - 1702398595520")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        animationView.play()
    }
}
