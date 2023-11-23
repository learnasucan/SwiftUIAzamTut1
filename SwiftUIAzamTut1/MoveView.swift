//
//  MoveView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct MoveView: View {
    
    @State var arrayList = ["samir","vishal","shailendra"]
    
    private func moveItems(from indices : IndexSet, position toOffset : Int){
        arrayList.move(fromOffsets: indices, toOffset: toOffset)
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Hello, World!")
                    .fontDesign(.rounded)
                    .fontWeight(.bold)
                List() {
                    ForEach( arrayList, id: \.self) { name in
                        Text(name)
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                    }.onMove(perform: moveItems)
                    .listRowSeparator(.hidden)
                }.listStyle(.plain)
                    .toolbar{
                        EditButton()
                    }
                    
                
            }
            
        }
    }
}

#Preview {
    MoveView()
}
