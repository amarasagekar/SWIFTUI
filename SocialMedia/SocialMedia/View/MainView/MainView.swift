//
//  MainView.swift
//  SocialMedia
//
//  Created by AMAR on 01/10/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        //MARK: Tabview
        TabView{
            Text("Recent Post's")
                .tabItem {
                    Image(systemName: "rectangle.portait.on.rectangle.portrait.angled")
                    Text("Post's")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Profile")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
