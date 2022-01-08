//
//  FeedView.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 08.01.2022.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
      ZStack(alignment: .bottomTrailing) {
        ScrollView {
          VStack {
            ForEach(0..<20) { _ in
              TweetCell()
            }
          }.padding()
          
        }
        Button(action: {}, label: {
          Image(systemName: "pencil.circle.fill")
            .resizable()
            .renderingMode(.template)
            .frame(width: 32, height: 32)
            .padding()
        })
          .frame(width: 43, height: 43)
          .background(Color(.systemBlue))
          .foregroundColor(.white)
          .clipShape(Circle())
          .padding()
      }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
