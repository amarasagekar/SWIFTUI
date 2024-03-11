//
//  ContentView.swift
//  MapsBottomSheet
//
//  Created by AMAR on 03/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    var body: some View {
        TabView{
            ForEach(Tab.allCases, id: \.rawValue){tab in
                Text(tab.rawValue)
                    .tag(tab)
                    .tabItem {
                        Image(systemName: tab.symbol)
                        Text(tab.rawValue)
                    }
            }
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet){
            VStack(alignment: .leading, spacing: 10, content: {
                
            })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    ContentView()
}
//0.57
