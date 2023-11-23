//
//  ContentView3.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 14/11/23.
//

import SwiftUI

struct ContentView3: View {
     var arrayList = ["samir","vishal","shailendra"]

    var body: some View {
        
        List(arrayList.indices,id: \.self) { index  in
            let name = arrayList[index]
            HStack {
                Text("\(name)")
                    .frame(minWidth: 0,maxWidth: .infinity,minHeight: 50)
                Spacer()
            }.background(index % 2 == 0 ? Color.red : Color.yellow)
        }.listStyle(.plain)
    }
}

#Preview {
    ContentView3()
}
