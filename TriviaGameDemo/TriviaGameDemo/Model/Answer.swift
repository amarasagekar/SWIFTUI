//
//  Answer.swift
//  TriviaGameDemo
//
//  Created by AMAR on 18/10/23.
//

import Foundation
struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
