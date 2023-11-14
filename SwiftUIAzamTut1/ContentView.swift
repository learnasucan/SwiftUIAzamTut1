//
//  ContentView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    var arrayList = ["samir","vishal","shailendra"]
    
    var body: some View {
        
        List(arrayList,id: \.self) {name in
            Text(name)
        }.listStyle(.plain)
        
    }
}

#Preview {
    ContentView()
}
