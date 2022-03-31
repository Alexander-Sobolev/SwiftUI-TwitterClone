//
//  UploadTweetViewModel.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 29.03.2022.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
  @Binding var isPresented: Bool
  
  init(isPresented: Binding<Bool>) {
    self.isPresented = isPresented
  }
   
  func uploadTweet(caption: String) {
    guard let user = AuthViewModel.shared.user else { return }
    let docRef = COLLECTION_TWEETS.document()
    
    let data: [String: Any] = ["caption": caption,
                               "username": user.username,
                               "fullname": user.fullname,
                               "profileImageUrl": user.profileImageUrl,
                               "timestamp": Timestamp(date: Date()),
                               "likes": 0,
                               "uid": user.id,
                               "id": docRef.documentID]
    
    docRef.setData(data) { _ in
      print("success")
      self.isPresented = false
    }
    
  }
  
//  func uploadTweet(caption: String, completion: @escaping ((Error) -> Void)) {
//    guard let user = AuthViewModel.shared.user else { return }
//    let docRef = COLLECTION_TWEETS.document()
//    
//    let data: [String: Any] = ["caption": caption,
//                               "username": user.username,
//                               "fullname": user.fullname,
//                               "profileImageUrl": user.profileImageUrl,
//                               "timestamp": Timestamp(date: Date()),
//                               "likes": 0,
//                               "uid": user.id,
//                               "id": docRef.documentID]
//    
//    docRef.setData(data, completion: completion)
//  }
}
