//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by AMAR on 25/10/23.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    
    private let service = TweetService()
    
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLiketweet()
    }
    
    func likeTweet(){
        service.likeTweet(tweet) { 
            self.tweet.didLike = true
        }
    }
    
    func unliKeTweet(){
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLiketweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
