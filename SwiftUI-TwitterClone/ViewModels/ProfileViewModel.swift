//
//  ProfileViewModel.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 29.03.2022.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
  let user: User
  @Published var isFollowed = false
  
  init(user: User) {
    self.user = user
    checkUserISFollowed()
  }
  
  func follow() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
    let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
    
    followingRef.document(user.id).setData([:]) { _ in
        followersRef.document(currentUid).setData([:]) { _ in
            self.isFollowed = true
          }
      }
  }
  
  func unfollow() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
    let followersRef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
    
    followingRef.document(user.id).delete { _ in
      followersRef.document(currentUid).delete { _ in
        self.isFollowed = false
      }
    }
  }
  
  func checkUserISFollowed() {
    guard let currentUid = Auth.auth().currentUser?.uid else { return }
    let followingRef = COLLECTION_FOLLOWING.document(currentUid).collection("user-following")
    
    followingRef.document(user.id).getDocument { snapshot, _ in
      guard let isFollowed = snapshot?.exists else { return }
        self.isFollowed = isFollowed
      }
    }
  }

