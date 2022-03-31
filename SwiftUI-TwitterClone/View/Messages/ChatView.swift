//
//  ChatView.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 29.03.2022.
//

import SwiftUI

struct ChatView: View {
  let user: User
  @ObservedObject var viewModel: ChatViewModel
  @State var messageText: String = ""
  
  init(user: User) {
    self.user = user
    self.viewModel = ChatViewModel(user: user)
  }
  
  var body: some View {
    VStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 12) {
          ForEach(viewModel.messages) { message in
            MessageView(message: message)
          }
        }
      }.padding(.top)
      
      MessageInputView(messageText: $messageText, action: sendMessage)
        .padding()
      
    }.navigationTitle(user.username)
    
  }
  
  func sendMessage() {
    viewModel.sendMessage(messageText)
    messageText = ""
  }
}
