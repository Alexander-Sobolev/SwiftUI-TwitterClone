//
//  TweetActionViewModel.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 29.03.2022.
//

import SwiftUI
import Firebase

class TweetActionViewModel: ObservableObject {
  let tweet: Tweet
  @Published var didLike = false
  
  init(tweet: Tweet) {
    self.tweet = tweet
    checkIfUserLikeTweet()
  }
  
  func likeTweet() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let tweetLikeRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
    let userLikeRef = COLLECTION_USERS.document(uid).collection("user-likes")
    
    COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { _ in
      tweetLikeRef.document(uid).setData([:]) { _ in
        userLikeRef.document(self.tweet.id).setData([:]) { _ in
          self.didLike = true
        }
      }
    }
    
    
  }
  
  func unlikeTweet() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let tweetLikeRef = COLLECTION_TWEETS.document(tweet.id).collection("tweet-likes")
    let userLikeRef = COLLECTION_USERS.document(uid).collection("user-likes")
    
    COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes - 1]) { _ in
      tweetLikeRef.document(uid).delete { _ in
        userLikeRef.document(self.tweet.id).delete { _ in
          self.didLike = false
        }
      }
    }
  }
  
  func checkIfUserLikeTweet() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    let userLikeRef = COLLECTION_USERS.document(uid).collection("user-likes").document(tweet.id)
    
    userLikeRef.getDocument { snapshot, _ in
      guard let didLike = snapshot?.exists else { return }
      self.didLike = didLike
    }
  }
  
}
