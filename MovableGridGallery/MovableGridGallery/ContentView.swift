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
                    ForEach(arrColors, id: \.self){ color in
                        GeometryReader {
                            let size = $0.size
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color.gradient)
                                .draggable(color){
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(color.gradient.opacity(0.7))
                                        .frame(width: size.width, height: size.height)
                                        .onAppear{
                                          draggingColor = color
                                        }
                                }
                                .dropDestination (for: Color.self) { items, location in
                                    return false
                                } isTargeted: { status in
                                    if let draggingColor, status, draggingColor != color {
                                        if let sourceIndex = arrColors.firstIndex(of: draggingColor), let destinationIndex = arrColors.firstIndex(of: color) {
                                            withAnimation(.bouncy) {
                                                let sourceItem = arrColors.remove(at: sourceIndex)
                                                arrColors.insert(sourceItem, at: destinationIndex)
                                            }
                                        }
                                    }
                                }
                            
                        }
                        .frame(height: 100)
                        
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
