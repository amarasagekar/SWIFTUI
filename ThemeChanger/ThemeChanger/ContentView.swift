//
//  ContentView.swift
//  ThemeChanger
//
//  Created by AMAR on 13/01/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var scheme
    @State private var changeTheme: Bool = false
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    
    var body: some View {
        NavigationStack{
            List{
                Section("Appearance"){
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
            ///Since max height is 410
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ContentView()
}
