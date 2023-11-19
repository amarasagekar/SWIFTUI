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
                            
                            Text("Reading time: 3 mins")
                                .font(.custom("ArialRoundedMTBold", size: 8))
                                .foregroundStyle(.white)
                            
                        }
                        .padding()
                        
                    }), expanded: ExpandedView(content: {
                        VStack{
                            Text("The art of being an artist")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.white)
                                .font(.custom("ArialRoundedMTBold", size: 28))
                            
                            Text("Reading time: 3 mins")
                                .font(.custom("ArialRoundedMTBold", size: 28))
                                .foregroundStyle(.white)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                                .font(.custom("ArialRoundedMT", size: 14))
                                .foregroundStyle(.white)
                                Spacer()
                        }
                        .padding()
                        
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
