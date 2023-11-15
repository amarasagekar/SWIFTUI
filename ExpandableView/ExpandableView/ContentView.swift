//
//  ContentView.swift
//  ExpandableView
//
//  Created by AMAR on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ScrollView{
                VStack {
                    ExpandableView(thumbnail: ThumbnailView(content: {
                        VStack{
                            Text("The art of being an artist")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.white)
                            
                                .font(.custom("ArialRoundedMTBold", size: 20))
                        }
                    }), expanded: ExpandedView(content: {
                        
                    }))
                }
                .padding()
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    ContentView()
}
