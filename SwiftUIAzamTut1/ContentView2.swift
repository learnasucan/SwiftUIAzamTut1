//
//  ContentView2.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 14/11/23.
//

import SwiftUI

struct ContentView2: View {
    //Delete position at index
    @State var arrayList = ["samir","vishal","shailendra"]
    
    var body: some View {
        List () {
            ForEach(arrayList,id: \.self) {
                name in
                Text(name)
            }.onDelete(perform: { indexSet in
                
                deleteItem(indexSet: indexSet)
            })
        }.listStyle(.plain)
    }
    
    func deleteItem(indexSet: IndexSet) {
        arrayList.remove(atOffsets: indexSet)
    }
    
    
}

#Preview {
    ContentView2()
}
