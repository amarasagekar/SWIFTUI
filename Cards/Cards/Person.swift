//
//  Person.swift
//  Cards
//
//  Created by AMAR on 01/12/23.
//

import Foundation

struct Person {
    let headerImage: String
    let profileImage: String
    let name: String
    let fallowerCount: Int
    let jobTitle: String
}

let person1 = Person(headerImage: "headerImages1", profileImage: "profileImage1", name: "John Doe", fallowerCount: 1000, jobTitle: "Developer")
let person2 = Person(headerImage: "headerImages2", profileImage: "profileImage2", name: "Jane Smith", fallowerCount: 4000, jobTitle: "Designer")
