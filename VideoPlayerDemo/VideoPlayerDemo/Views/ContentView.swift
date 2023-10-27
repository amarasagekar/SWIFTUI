//
//  ContentView.swift
//  VideoPlayerDemo
//
//  Created by AMAR on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(Query.allCases, id: \.self){
                searchQuery in
                QueryTag(query: searchQuery, isSelected: false)
            }
        }
        .background(Color("AccentColor"))
    }
}

#Preview {
    ContentView()
}
