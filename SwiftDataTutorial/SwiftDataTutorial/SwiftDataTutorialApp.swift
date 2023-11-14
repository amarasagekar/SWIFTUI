//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by AMAR on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
//    let container: ModelContainer = {
//        let schema = Schema([Expanse.self])
//        let container = try! ModelContainer(for: schema,configurations: [])
//        return container
//    }()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(container)
        .modelContainer(for: [Expanse.self])
    }
}
