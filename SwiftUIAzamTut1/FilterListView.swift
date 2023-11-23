//
//  FilterListView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct TitleImage : Identifiable {
    var id: UUID = UUID()
    var name: String
    var photo: String
}


struct FilterListView: View {
    
    private func getPhoto() -> [TitleImage] {
        return ([TitleImage(name: "sparrow", photo: "sparrow"),
                 TitleImage(name: "snail", photo: "snail"),
                 TitleImage(name: "puma", photo: "puma"),
                 TitleImage(name: "peacock", photo: "peacock"),
                 TitleImage(name: "owl", photo: "owl"),
                 TitleImage(name: "mountain", photo: "mountain"),
                 TitleImage(name: "dragonfly", photo: "dragonfly")])
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        let imageList = getPhoto()
        
        List(imageList,id: \.id)  { image in
        
            HStack {
                Image(image.photo)
                    .resizable()
                    .frame(maxWidth: 100,maxHeight: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            }
        }
        
    }
}

#Preview {
    FilterListView()
}
