//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
       
            //HomeScreen()
            
            VStack{
                DetailScreen()
            }
        }
    
}





struct ColorDotView: View {
    
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}


