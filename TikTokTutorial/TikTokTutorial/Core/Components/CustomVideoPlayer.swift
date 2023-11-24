//
//  CustomVideoPlayer.swift
//  TikTokTutorial
//
//  Created by AMAR on 24/11/23.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable{
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill // makes video full screen
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
