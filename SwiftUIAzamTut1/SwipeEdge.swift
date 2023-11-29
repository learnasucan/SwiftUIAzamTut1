//
//  SwipeEdge.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//

import SwiftUI

struct SwipeEdge: View {
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
                    
                }.padding()
                    .swipeActions(edge: .leading) { //IMP
                        Button {
                            print("Lead edge")
                        } label: {
                            Label("Heart", systemImage: "heart.circle")
                        }.tint(.yellow)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {//IMP
                        Button {
                            print("Trail edge")
                        } label: {
                            Image(systemName: "tree")
                                .tint(.accentColor)
                        }

                    }
                
            }.listStyle(.plain)
               
            
                .navigationTitle("EdgeSwipe")
        }
        
    }
}

#Preview {
    SwipeEdge()
}
