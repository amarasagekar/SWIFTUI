//
//  VideoFiles.swift
//  SnapTransition
//
//  Created by AMAR on 04/10/23.
//

import SwiftUI
import AVKit

struct VideoFile: Identifiable{
    var id: UUID = .init()
    var fileURL: URL
    var thumbnail: UIImage?
    var player: AVPlayer
    var offset:CGSize = .zero
    var playVideo: Bool = false
}

var videoURL1: URL = URL(filePath: Bundle.main.path(forResource: "Reel1", ofType: "mp4") ?? "")
var videoURL2: URL = URL(filePath: Bundle.main.path(forResource: "Reel2", ofType: "mp4") ?? "")
var videoURL3: URL = URL(filePath: Bundle.main.path(forResource: "Reel3", ofType: "mp4") ?? "")
var videoURL4: URL = URL(filePath: Bundle.main.path(forResource: "Reel2", ofType: "mp4") ?? "")
var videoURL5: URL = URL(filePath: Bundle.main.path(forResource: "Reel3", ofType: "mp4") ?? "")


var files: [VideoFile] = [
    .init(fileURL: videoURL1, player: AVPlayer(url: videoURL1)),
    .init(fileURL: videoURL2, player: AVPlayer(url: videoURL2)),
    .init(fileURL: videoURL3, player: AVPlayer(url: videoURL3)),
    .init(fileURL: videoURL4, player: AVPlayer(url: videoURL4)),
    .init(fileURL: videoURL5, player: AVPlayer(url: videoURL5)),
]
