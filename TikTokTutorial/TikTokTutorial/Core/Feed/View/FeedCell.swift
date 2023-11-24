//
//  FeedCell.swift
//  TikTokTutorial
//
//  Created by AMAR on 23/11/23.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer){
        self.post = post
        self.player = player
    }
    
    var body: some View {
        ZStack {
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
                
            VStack{
               Spacer()
                
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text("carlos.sainz")
                            .fontWeight(.semibold)
                        
                        Text("Rocket ship prepare for takeoff!!!")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28){
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.gray)
                        
                        Button{
                            
                        } label: {
                            VStack{
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("22")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            VStack{
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("12")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .bold()
                                
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 22, height: 28)
                                .foregroundStyle(.white)
                        }
                        Button{
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
        
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
}
