//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by AMAR on 07/11/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label("Wishlists", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
            
        }
    }
}

#Preview {
    MainTabView()
}
