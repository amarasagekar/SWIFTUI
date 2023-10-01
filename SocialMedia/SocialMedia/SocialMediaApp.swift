//
//  SocialMediaApp.swift
//  SocialMedia
//
//  Created by AMAR on 30/09/23.
//

import SwiftUI
import Firebase

@main
struct SocialMediaApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
