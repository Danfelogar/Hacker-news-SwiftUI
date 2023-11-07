//
//  ContentView.swift
//  Hacker-news-SwiftUI
//
//  Created by Daniel Felipe on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManafer = NetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManafer.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            //this methods is like a useEffect do action when first render screen
            self.networkManafer.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
