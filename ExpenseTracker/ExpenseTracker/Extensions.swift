//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by AMAR on 26/10/23.
//

import Foundation
import SwiftUI

extension Color {
    static let backgroundC = Color("Background")
    static let iconC = Color("Icon")
    static let textC = Color("Text")
    static let systembackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        
        return parsedDate
    }
}

extension Date: Strideable {
    func formatted()-> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
