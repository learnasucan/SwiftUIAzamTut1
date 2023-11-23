//
//  UpdateTask.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 23/11/23.
//

import SwiftUI

struct UpdateTask: View {
    @State var textfieldText: String = ""
    @State var tasks: [String] = [String]()
    
    var body: some View {
        VStack {
            HStack(content: {
                TextField("Enter your TEXT", text: $textfieldText)
                Button("+") {
                    tasks.append(textfieldText.lowercased())
                    textfieldText = ""
                }
            }).padding()
            List() {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
            }
        }.background(Color.mint)
    }
}

#Preview {
    UpdateTask()
}
