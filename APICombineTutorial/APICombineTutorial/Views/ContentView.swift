//
//  ContentView.swift
//  APICombineTutorial
//
//  Created by AMAR on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArtworkViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.artworks) { artwork in
                    ArtworkView(artwork: artwork)
            }
            .navigationTitle("Artworks")
            .onAppear{
                viewModel.fetchArtwork()
            }
        }
    }
}

#Preview {
    ContentView()
}
