//
//  PlaceholderResponsemodel.swift
//  MVVMSwiftUICombine
//
//  Created by AMAR on 14/12/23.
//

import Foundation

struct PlaceholderResponsemodelElemennt : Codable, Identifiable{
    let userID, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey{
        case userId = "userID"
        case id, title, body
    }
}

typealias PlaceholderResponsemodel = [PlaceholderResponsemodelElemennt]
