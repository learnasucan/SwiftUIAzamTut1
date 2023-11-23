//
//  ListBackgroundColor.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct ListBackgroundColor: View {
    
    init(){
    UITableView.appearance().backgroundColor = UIColor.purple
    }
    
    var body: some View {
      
        
        List() {
            
            ForEach(1...20, id: \.self) { index in
                Text("\(index)")
            }.listRowBackground(Color.blue)
        }
        .scrollContentBackground(.hidden)
//        
//        .listRowSpacing(20)
//        .listRowSeparator(.visible)
        .background(.pink)
//        .scrollContentBackground(.hidden)
        
    }
}

#Preview {
    ListBackgroundColor()
}
