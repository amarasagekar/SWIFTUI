//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by AMAR on 24/10/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let servcie = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets(){
        servcie.fetchTweet{ tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
//            tweets.forEach { tweet in
//                let uid = tweet.uid
//                
//                self.userService.fetchUser(withUid: uid) { user in
//                    <#code#>
//                }
//            }
        }
    }
}
