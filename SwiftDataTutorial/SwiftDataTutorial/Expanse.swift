//
//  Expanse.swift
//  SwiftDataTutorial
//
//  Created by AMAR on 14/11/23.
//

import Foundation
import SwiftData

@Model
class Expanse {
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
