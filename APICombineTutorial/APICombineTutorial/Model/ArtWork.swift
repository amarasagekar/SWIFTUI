//
//  ArtWork.swift
//  APICombineTutorial
//
//  Created by AMAR on 12/11/23.
//

struct ArtworkDataResponse: Decodable {
    let data: [Artwork]
}

struct Artwork: Decodable, Identifiable{
    let id: Int
    let title: String
    let imageId: String?
}

let previewArtwork = Artwork(id: 16487, title: "The bay of marseille, seen from L\'Estaque", imageId: "d4ca6321-8656-3d3f-2ee297b2b813")
