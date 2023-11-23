//
//  GroupView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var comments:[Comment] = [Comment]()
    
}
struct Comment: Identifiable {
    var id = UUID()
    var comment: String
}

struct GroupView: View {
    
    let posts = [
        Post(title: "Directions",comments: [
            Comment(comment: "North"),
            Comment(comment: "South"),
            Comment(comment: "West"),
            Comment(comment: "East"),]),
        Post(title: "Locations",comments: [
            Comment(comment: "UP"),
            Comment(comment: "TamilNadu"),
            Comment(comment: "Maharashtra"),
            Comment(comment: "West Bangal")])
        
    ]
    
    var body: some View {
        List() {
            ForEach(posts) { post in
                Section(header:/*@START_MENU_TOKEN@*/Text(post.title)/*@END_MENU_TOKEN@*/) {
                    ForEach(post.comments) { comment in
                        Text(comment.comment)
                    }
                }
            }
            
        }.listStyle(.grouped)
    }
}

#Preview {
    GroupView()
}
