//
//  ScrollToIndex.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//

import SwiftUI

struct ScrollToIndex: View {
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                VStack {
                    Button{
                        proxy.scrollTo(345)
                    }label: {
                        Text("Scroll To")
                    }
                    List(1...500,id: \.self)  { index in
                            Text("\(index)")
                                .fontWeight(.black)
                                .padding(8.0)
                                .id(index)
                            
                        }
                    .listStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    ScrollToIndex()
}
