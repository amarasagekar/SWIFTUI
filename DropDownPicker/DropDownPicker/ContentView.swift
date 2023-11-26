//
//  ContentView.swift
//  DropDownPicker
//
//  Created by Immortal Lion on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    //View Properties
    @State private var selection: String?
    @State private var selection1: String?
    @State private var selection2: String?
    
    var body: some View {
        NavigationStack{
            Button("Click Me"){
                
            }
            
            VStack(spacing: 15){
                DropDownView(
                    hint:"Select",
                    options: [
                    "Youtube",
                    "Instagram",
                    "X (Twitter)",
                    "Snapchart",
                    "TikTok",
                    ],
                    anchor: .bottom,
                    selection: $selection
                )
                
                DropDownView(
                    hint:"Select",
                    options: [
                    "Hello",
                    "World"
                    ],
                    anchor: .top,
                    selection: $selection
                )
                
                
                DropDownView(
                    hint:"Select",
                    options: [
                    "Short Form",
                    "Long Form",
                    "Both",
                    ],
                    anchor: .top,
                    selection: $selection
                )
                
                Button("Click Me"){
                    
                }

            }
            .navigationTitle("Dropdown Picker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
