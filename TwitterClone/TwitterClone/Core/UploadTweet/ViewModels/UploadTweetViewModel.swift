//
//  UploadTweetViewModel.swift
//  TwitterClone
//
//  Created by AMAR on 24/10/23.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let servcie = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        servcie.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else{
                
            }
            
        }
    }
}
