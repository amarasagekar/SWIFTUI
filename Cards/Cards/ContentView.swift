//
//  ContentView.swift
//  Cards
//
//  Created by AMAR on 01/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            PersonCardView(person: person1)
                .listRowSeparator(.hidden)
            
            PersonCardView(person: person2)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
