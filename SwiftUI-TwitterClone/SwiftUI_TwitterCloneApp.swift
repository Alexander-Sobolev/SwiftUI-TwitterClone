//
//  SwiftUI_TwitterCloneApp.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 07.01.2022.
//

import SwiftUI
import Firebase

@main
struct SwiftUI_TwitterCloneApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(AuthViewModel())
          
        }
    }
}
