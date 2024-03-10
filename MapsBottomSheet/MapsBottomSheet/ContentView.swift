//
//  ContentView.swift
//  MapsBottomSheet
//
//  Created by AMAR on 03/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ForEach(Tab.allCases, id: \.rawValue){tab in
                Text(tab.rawValue)
                    .tag(tab)
                    .tabItem {
                        Image(systemName: tab.symbol)
                        Text(tab.rawValue)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
