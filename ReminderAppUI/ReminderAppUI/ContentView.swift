//
//  ContentView.swift
//  ReminderAppUI
//
//  Created by Immortal Lion on 24/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct DateValue: Identifiable{
    var id =  UUID().uuidString
    var day: Int
    var date: Date
}

extension Date{
    func getAllDate()->[Date]{
        let calender = Calendar.current
        let startDate = calender.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        let range = calender.range(of: .day, in: .month, for: startDate)!
        return range.compactMap { day -> Date in
            return calender.date(byAdding: .day, value: day-1, to: startDate)!
        }
    }
}
