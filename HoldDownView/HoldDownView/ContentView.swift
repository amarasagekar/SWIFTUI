//
//  ContentView.swift
//  HoldDownView
//
//  Created by Immortal Lion on 22/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    var body: some View {
        NavigationStack{
            VStack {
                Text("\(count)")
                    .font(.largeTitle.bold())
                
                HoldDownButton(
                    text: "Hold to Increase",
                    duration: 0.5,
                    background: .black,
                    loadingTint: .white.opacity(0.3)
                ) {
                    count += 1
                }
                .foregroundStyle(.white)
                .padding(.top, 45)
            }
            .padding()
            .navigationTitle("Hold Down Button")
        }
    }
}

#Preview {
    ContentView()
}
