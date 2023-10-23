//
//  User.swift
//  TwitterClone
//
//  Created by AMAR on 23/10/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let profileImageUrl: String
    let email: String
}
