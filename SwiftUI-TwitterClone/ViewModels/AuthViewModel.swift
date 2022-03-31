//
//  AuthViewModel.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 29.03.2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  
  @Published var userSession: FirebaseAuth.User?
  @Published var isAuthenticating = false
  @Published var error: Error?
  @Published var user: User?
  
  static let shared = AuthViewModel()
  
  init() {
    userSession = Auth.auth().currentUser
  }
  
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        print("Error \(error.localizedDescription)")
        return
      }
      print("Success")
    }
  }
  
  func registerUser(email: String, password: String, username: String, fullname: String, profileImageUrl: UIImage) {
    guard let imageData = profileImageUrl.jpegData(compressionQuality: 0.3) else { return }
    let filename = NSUUID().uuidString
    let storageRef = Storage.storage().reference().child(filename)
    
    storageRef.putData(imageData, metadata: nil) { _, error in
      if let error = error {
        print("Error \(error.localizedDescription)")
        return
      }
      print("Success")
      
      storageRef.downloadURL { url, _ in
        guard let profileImage = url?.absoluteString else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
          if let error = error {
            print("Error \(error.localizedDescription)")
            return
        }
          guard let user = result?.user else { return }
          
          let data = ["email": email,
                      "username": username,
                      "fullname": fullname,
                      "profileImageUrl": profileImageUrl,
                      "uid": user.uid] as [String : Any]
          
          Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
            print("Success")
            
          }
      }
      
    }
    
  }
  
}
  func signOut() {
    userSession = nil
    try? Auth.auth().signOut()
  }
}
