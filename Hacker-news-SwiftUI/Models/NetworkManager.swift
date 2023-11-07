//
//  NetworkManager.swift
//  Hacker-news-SwiftUI
//
//  Created by Daniel Felipe on 28/09/23.
//

import Foundation
//In Swift, ObservableObject is a protocol that allows a class to be observed by other objects. When a class implements this protocol, it can be used with SwiftUI syntax for data binding
class NetworkManager: ObservableObject {
    // access is given to the post property so they can read it
   @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Result.self, from: safeData)
                            //With this code we give the UI the opportunity to refresh asynchronously
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
