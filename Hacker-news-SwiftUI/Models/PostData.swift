//
//  PostData.swift
//  Hacker-news-SwiftUI
//
//  Created by Daniel Felipe on 28/09/23.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}
// with Identificable need show bug for needed id in the List render and is mandatory make "id" for the struct
struct Post: Decodable, Identifiable {
    //With this code the property or value of "objectID" is assigned to "id"
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
