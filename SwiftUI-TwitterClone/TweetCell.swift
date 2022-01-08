//
//  TweetCell.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 08.01.2022.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
      VStack {
        HStack(alignment: .top) {
          Image("Swift")
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width: 66, height: 56)
            .cornerRadius(66 / 2)
          
          VStack(alignment: .leading, spacing: 4) {
            HStack {
              Text("Swift")
                .font(.system(size: 14, weight: .semibold))
              
              Text("description")
                .foregroundColor(.gray)
              
              Text("2w")
                .foregroundColor(.gray)
            }
            
            Text("Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift Swift")
            
          }
        }.padding(.bottom)
         .padding(.trailing)
        HStack {
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "bubble.left")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
          
          Spacer()
          
          Button(action: {}, label: {
            Image(systemName: "arrow.2.squarepath")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
          
          Spacer()
          
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "heart")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
          
          Spacer()
          
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "bookmark")
              .font(.system(size: 16))
              .frame(width: 32, height: 32)
          })
        }.foregroundColor(.gray)
        .padding(.horizontal)
        
        Divider()
      }
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
