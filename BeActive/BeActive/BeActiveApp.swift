//
//  BeActiveApp.swift
//  BeActive
//
//  Created by AMAR on 15/12/23.
//

import SwiftUI

@main
struct BeActiveApp: App {
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            BeActiveTabView()
                .environmentObject(manager)
        }
    }
}
