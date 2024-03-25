//
//  ContentView.swift
//  MovableGridGallery
//
//  Created by AMAR on 25/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var arrColors: [Color] = [.purple, .black, .indigo, .cyan, .brown, .yellow, .mint, .orange, .red, .green, .gray, .teal, .yellow.opacity(0.5)
    ]
    @State var draggingColor: Color?
    
    var body: some View {
        VStack {
            Text("SwiftUI Movable Grid")
                .bold()
                .font(.title)
            
            ScrollView(.vertical){
                let column = Array(repeating: GridItem(spacing: 10), count: 3)
                LazyVGrid(columns: column, spacing: 10, content: {
                    ForEach(arrColors, id: \.self){
                        
                    }
                    
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
