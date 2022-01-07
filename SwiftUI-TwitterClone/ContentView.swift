//
//  ContentView.swift
//  SwiftUI-TwitterClone
//
//  Created by Alexander Sobolev on 07.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView{
        
        TabView {
          Text("Feed")
            .tabItem {
              Image(systemName: "house")
              Text("Home")
            }
          
          Text("Search View")
            .tabItem {
              Image(systemName: "magnifyingglass")
              Text("Search")
            }
          
          Text("Message")
            .tabItem {
              Image(systemName: "envelope")
              Text("Message")
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
