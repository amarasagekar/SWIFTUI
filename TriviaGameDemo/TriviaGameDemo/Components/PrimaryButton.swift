//
//  PrimaryButton.swift
//  TriviaGameDemo
//
//  Created by AMAR on 18/10/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
        
    }
}

#Preview {
    PrimaryButton(text: "Next")
}
