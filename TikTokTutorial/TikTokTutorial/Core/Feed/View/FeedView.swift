//
//  FeedView.swift
//  TikTokTutorial
//
//  Created by AMAR on 23/11/23.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewmodel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0) {
                ForEach(viewmodel.posts){post in
                   FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear{
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{
            player.play()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playeVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }
    
    func playInitialVideoIfNecessary(){
        guard scrollPosition == nil, let post = viewmodel.posts.first, player.currentItem == nil else { return }
        
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
    func playeVideoOnChangeOfScrollPosition(postId: String?){
        guard let currentPost = viewmodel.posts.first(where: {$0.id == postId}) else {return}
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
