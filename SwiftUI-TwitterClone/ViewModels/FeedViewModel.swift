//
//  FeedViewModel.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 29.03.2022.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
  
  init() {
    fetchTweets()
  }
  
  func fetchTweets() {
    COLLECTION_TWEETS.getDocuments { snapshot, _ in
      guard let document = snapshot?.documents else { return }
      self.tweets = document.map({ Tweet(dictionary: $0.data()) })
      print("Tweets \(self.tweets)")
      
    }
  }
}
