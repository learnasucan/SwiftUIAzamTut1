//
//  ScrollviewList.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct ScrollviewList: View {
    var body: some View {
        
        VStack {
            Text("Hello, World!")
            ScrollView{
                LazyVStack {
                    ForEach(1...20, id: \.self) { index in
                        VStack (alignment: .leading){
                            HStack {
                                Text("\(index)")
                                Spacer()
                            }
                        }
                    }.padding()
                }.background(Color.green)
            }
        }.background(Color.yellow)
    }
}

#Preview {
    ScrollviewList()
}
