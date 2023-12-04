//
//  UberTutorialApp.swift
//  UberTutorial
//
//  Created by AMAR on 29/11/23.
//

import SwiftUI

@main
struct UberTutorialApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
