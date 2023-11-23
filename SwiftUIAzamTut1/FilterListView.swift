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

func getPhoto() -> [TitleImage] {
    return ([TitleImage(name: "sparrow", photo: "sparrow"),
             TitleImage(name: "snail", photo: "snail"),
             TitleImage(name: "puma", photo: "puma"),
             TitleImage(name: "peacock", photo: "peacock"),
             TitleImage(name: "owl", photo: "owl"),
             TitleImage(name: "mountain", photo: "mountain"),
             TitleImage(name: "dragonfly", photo: "dragonfly")])
}

struct FilterListView: View {
    
    @State var searchName: String = ""
    
    
    @State private var imageList = getPhoto()
    
    var body: some View {
        
        
        NavigationView {
            List(imageList,id: \.id)  { image in
            
                HStack(alignment: .top) {
                    Image(image.photo)
                        .resizable()
                        .frame(maxWidth: 100,maxHeight: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                    Text(image.name.capitalized)
                        .fontWeight(.black)
                        .padding(8.0)
                    
                }
                .padding()
            }.listStyle(.plain)
                .searchable(text: $searchName)
                .onChange(of: searchName) { name in
                    if !name.isEmpty && name.count >= 1 {
                        imageList = imageList.filter{
                            $0.name.lowercased().hasPrefix(searchName.lowercased())
                        }
                    } else {
                        imageList = getPhoto()
                    }
                }
            
                .navigationTitle("Images")
        }
        
    }
}

#Preview {
    FilterListView()
}
