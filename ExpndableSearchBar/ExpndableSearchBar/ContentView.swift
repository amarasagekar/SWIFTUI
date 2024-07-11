//
//  ContentView.swift
//  ExpndableSearchBar
//
//  Created by AMAR on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Home()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
