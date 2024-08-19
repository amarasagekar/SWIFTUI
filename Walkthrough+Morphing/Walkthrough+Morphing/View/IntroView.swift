//
//  IntroView.swift
//  Walkthrough+Morphing
//
//  Created by Immortal Lion on 19/08/24.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        GeometryReader{
            let size = $0.size
            VStack {
                
            }
        }
        .background{
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
