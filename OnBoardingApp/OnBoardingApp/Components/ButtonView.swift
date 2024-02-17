//
//  ButtonView.swift
//  OnBoardingApp
//
//  Created by AMAR on 17/02/24.
//

import SwiftUI

struct ButtonView: View {

    var onPress: ()->()
    
    var body: some View {
        Button{
            print("Button pressed")
           onPress()
        }label: {
            HStack{
                Text("Start")
                Image(systemName: "arrow.forward.circle")
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 12)
            .background(
                Capsule().strokeBorder(lineWidth: 2)
            )
            .foregroundStyle(.white)
        }
        .buttonStyle(.plain)
        .accentColor(.white)
    }
}

#Preview {
    ButtonView(onPress: {
        print("Button Pressed")
    }).previewLayout(.sizeThatFits)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
