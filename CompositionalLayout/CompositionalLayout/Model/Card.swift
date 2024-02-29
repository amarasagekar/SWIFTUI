//
//  Card.swift
//  CompositionalLayout
//
//  Created by Immortal Lion on 23/02/24.
//

//picsum.photos/v2/list?page=2&limit=100
import SwiftUI

struct Card: Identifiable, Decodable, Hashable {
    var id: String
    var download_url: String
    var author: String
}

