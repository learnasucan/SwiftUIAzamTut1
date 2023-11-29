//
//  ExpandableHeader.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//

import SwiftUI

struct Place: Identifiable {
    let id: UUID = UUID()
    let name: String
    let hikes: [Hike]
}

struct Hike: Identifiable {
    let id: UUID = UUID()
    let name: String
}

private func getPlaces()-> [Place] {
    return [Place(name: "Place1",hikes: [Hike(name: "hike1"),
                                         Hike(name: "hike2"),
                                         Hike(name: "hike3"),
                                         Hike(name: "hike4")]),
            Place(name: "Place2",hikes: [Hike(name: "hike1"),
                                         Hike(name: "hike2"),
                                         Hike(name: "hike3"),
                                         Hike(name: "hike4")])]
}
struct ExpandableHeader: View {
    @State private var places = getPlaces()
    @State private var expanded: Bool = false
    @State private var selectedPlace : String = ""
    
    var body: some View {
        List(places){ place in
            HStack {
                Text(place.name)
                    .fontWeight(.bold)
                    .padding(.bottom,10)
                Spacer()
                Image(systemName: expanded ? "chevron.down" : "chevron.right")
                
            }.onTapGesture {
                expanded.toggle()
                selectedPlace = expanded ? place.name : ""
            }
            
            if selectedPlace == place.name {
                ForEach(place.hikes) { place in
                    Text(place.name)
                }
            }
        }
    }
}

#Preview {
    ExpandableHeader()
}
