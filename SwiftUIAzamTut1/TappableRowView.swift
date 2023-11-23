//
//  TappableRowView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 24/11/23.
//

import SwiftUI

struct TappableRowView: View {
    
    @State var selectedIndex: Int?
    
    var body: some View {
        VStack {
            List(1...20, id: \.self) { index in
                HStack {
                    Text("\(index)")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {
                    
                    selectedIndex = index
                })
            }
            selectedIndex.map{
                Text("\($0)")
            }
        }
    }
}

#Preview {
    TappableRowView()
}
