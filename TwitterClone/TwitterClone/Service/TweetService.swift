//
//  TweetService.swift
//  TwitterClone
//
//  Created by AMAR on 24/10/23.
//

import Firebase

struct TweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void ) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption" : caption,
                    "likes" : 0,
                    "timestamp"  : Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchTweet(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let tweets = documents.compactMap({ try? $0.data(as: Tweet.self)})
            completion(tweets)
        }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                var tweets = documents.compactMap({ try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            }
        
    }
}
