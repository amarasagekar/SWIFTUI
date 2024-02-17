//
//  ContentView.swift
//  OnBoardingApp
//
//  Created by AMAR on 17/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnBoarding") var isOnBoarding:Bool = true
    
    var body: some View {
        if isOnBoarding{
            TabView{
                ForEach(outdoorActivityData){
                    item in
                    OnBoardingView(outDoorActivity: item)
                }
            }.tabViewStyle(PageTabViewStyle())
                .ignoresSafeArea()
        } else{
            HomeScreen()
        }
    }
}

#Preview {
    ContentView()
}
