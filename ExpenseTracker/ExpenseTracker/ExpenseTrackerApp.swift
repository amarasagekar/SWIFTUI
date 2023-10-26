//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by AMAR on 26/10/23.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
