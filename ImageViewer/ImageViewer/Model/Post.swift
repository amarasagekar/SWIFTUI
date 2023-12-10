//
//  Post.swift
//  ImageViewer
//
//  Created by AMAR on 10/12/23.
//

import SwiftUI

struct Post: Identifiable {
    let id: UUID = .init()
    var username: String
    var content: String
    var pics: [PicItem]
    
    var scrollPostion: UUID?
}
/// smaple post
var samplePosts: [Post] = [
    .init(username: "tom cruise", content: "tech pis", pics: pics),
    .init(username: "tom cruise", content: "tech pis", pics: pics.reversed())
]
private var pics:[PicItem] = (1...5).compactMap { index -> PicItem? in
    return .init(image: "Pic \(index)")
}
