//
//  BeActiveTabView.swift
//  BeActive
//
//  Created by AMAR on 15/12/23.
//

import SwiftUI

struct BeActiveTabView: View {
    @State var selectiontab = "Home"
    
    var body: some View {
        TabView(selection: $selectiontab){
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                }
            ContentView()
                .tag("Content")
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    BeActiveTabView()
}
