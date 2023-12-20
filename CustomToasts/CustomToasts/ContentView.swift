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
                Toast.shared.present(title: "", symbol: "")
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
