//
//  TextArea.swift
//  TwitterClone
//
//  Created by AMAR on 15/10/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeHolder: String
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeHolder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 23)
            }
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}

