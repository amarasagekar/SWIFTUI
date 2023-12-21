//
//  ContentView.swift
//  CustomToasts
//
//  Created by AMAR on 18/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Present Toast") {
                Toast.shared.present(
                    title: "Hello World",
                    symbol: "globe",
                    isuserIntractionEnabled: false,
                    timing: .long
                )
            }
        }
        .padding()
    }
}

#Preview {
    RootView{
        ContentView()
    }
}
