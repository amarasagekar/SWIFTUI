//
//  MVVMSwiftUICombineApp.swift
//  MVVMSwiftUICombine
//
//  Created by AMAR on 14/12/23.
//

import SwiftUI

@main
struct MVVMSwiftUICombineApp: App {
    var body: some Scene {
        WindowGroup {
            let service = ContentService()
            let viewModel = ContentViewModel(service: service)
            ContentView(viewModel: viewModel)
        }
    }
}
