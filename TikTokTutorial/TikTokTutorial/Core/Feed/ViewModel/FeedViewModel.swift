//
//  FeedViewModel.swift
//  TikTokTutorial
//
//  Created by AMAR on 24/11/23.
//

import Foundation
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
     let videoUrls = [
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4" ,
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
    ]
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[3]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[4]),
        
        ]
    }
}
