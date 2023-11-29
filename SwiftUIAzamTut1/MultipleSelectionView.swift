//
//  MultipleSelectionView.swift
//  SwiftUIAzamTut1
//
//  Created by Prachit on 29/11/23.
//

import SwiftUI
struct Customer: Identifiable {
    var id = UUID()
    let name: String
}

struct MultipleSelectionView: View {
    
    @State private var customers = [Customer(name: "Aadi"),
                                    Customer(name: "Raghu"),
                                    Customer(name: "Pati"),
                                    Customer(name: "Sriram"),
                                    Customer(name: "Raghav"),
                                    Customer(name: "Rajaram"),
                                    Customer(name: "Pati"),
                                    Customer(name: "Sriram"),
                                    Customer(name: "Raghav"),
                                    Customer(name: "Rajaram"),]
    
    @State private var selectedCustomerIds = Set<UUID>()
    var body: some View {
        NavigationView(content: {
            VStack {
                NavigationLink(destination: Text("Destination")) { Text("Navigate") }
                List(customers,selection:$selectedCustomerIds) {customer in
                    HStack {
                        Text(customer.name)
                        Spacer()
                    }
                   
                }.listStyle(.plain)
                    .toolbar(content: {
                        EditButton()
                    })
                Text("Selected: \(selectedCustomerIds.count)")
                List(Array(selectedCustomerIds),id:\.self) {index in
                    if let customer = customers.first(where: { $0.id == index }) {
                        Text(customer.name)
                    } else {
                        Text("Customer not found")
                    }                }
            }
            
        })
    }
}

#Preview {
    MultipleSelectionView()
}
