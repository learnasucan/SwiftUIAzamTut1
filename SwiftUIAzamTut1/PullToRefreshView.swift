//
//  PullToRefreshView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct PullToRefreshView: View {
    
    @State var dates = [Date]()
    
    var body: some View {
    
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                List(dates,id: \.self){ date in
                    Text("\(date)")
                    
                }.listStyle(.plain)
                    .refreshable {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            dates.append(Date.now)
                        }
                }
            }.navigationTitle("Pull To refresh")
        }
    }
}

#Preview {
    PullToRefreshView()
}
