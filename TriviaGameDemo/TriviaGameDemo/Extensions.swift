//
//  Extensions.swift
//  TriviaGameDemo
//
//  Created by AMAR on 18/10/23.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
