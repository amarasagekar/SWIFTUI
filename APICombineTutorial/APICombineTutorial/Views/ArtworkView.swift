//
//  ArtworkView.swift
//  APICombineTutorial
//
//  Created by AMAR on 12/11/23.
//

import SwiftUI

struct ArtworkView: View {
    let artwork: Artwork
    
    var body: some View {
        NavigationLink{
            ArtworkDetailView(artwork: artwork)
        } label: {
            Text(artwork.title)
        }
    }
}

#Preview {
    ArtworkView(artwork: previewArtwork)
        .previewLayout(.sizeThatFits)
}
