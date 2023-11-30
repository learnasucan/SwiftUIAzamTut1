//
//  Article.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//

import Foundation

struct ArticleList:Decodable,Identifiable {
    var id:String { UUID().uuidString }
    let articles: [Article]
    let meta: Meta
}

struct Meta: Decodable {
    let currentPage: Int
    let totalPages: Int
    let totalArticles: Int
}

struct Article: Decodable,Identifiable {
    var id :String {
        self.title
    }
    let title: String
    let url: String
    let thumbnail: String
    let published: String
    let source: String
    

}

