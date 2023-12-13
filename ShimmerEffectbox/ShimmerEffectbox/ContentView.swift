//
//  ContentView.swift
//  ShimmerEffectbox
//
//  Created by AMAR on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.gray
            
            ScrollView{
                LazyVStack(spacing: 1){
                    ForEach(0 ..< 5) {_  in
                        ContentLoader()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
