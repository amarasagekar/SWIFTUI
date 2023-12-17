//
//  BeActiveTabView.swift
//  BeActive
//
//  Created by AMAR on 15/12/23.
//

import SwiftUI

struct BeActiveTabView: View {
    @EnvironmentObject var manager : HealthManager
    @State var selectiontab = "Home"
    
    var body: some View {
        TabView(selection: $selectiontab){
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                }
                .environmentObject(manager)
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
