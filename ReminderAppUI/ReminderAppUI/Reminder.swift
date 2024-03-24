//
//  Reminder.swift
//  ReminderAppUI
//
//  Created by Immortal Lion on 24/03/24.
//

import SwiftUI

struct Reminder: Identifiable {
    var id = UUID().uuidString
    var title:String
    var time: Date = Date()
}

struct ReminderData: Identifiable {
    var id = UUID().uuidString
    var remind: [Reminder]
    var remindDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let caleder = Calendar.current
    
    let date = caleder.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

//Samle reminder...
var tasks: [ReminderData] = [
    ReminderData(remind:[
    Reminder(title: "Research NFT'S"),
    Reminder(title: "Film YouTube content"),
    Reminder(title: "SwiftUI Research"),
    ], remindDate: getSampleDate(offset: -15)),
    
    ReminderData(remind:[
        Reminder(title: "Christmas Shopping"),
        ], remindDate: getSampleDate(offset: 4)),
    
    ReminderData(remind:[
        Reminder(title: "Create weekly UIn Design Posts"),
        ], remindDate: getSampleDate(offset: 6)),
    
    ReminderData(remind:[
        Reminder(title: "File YouTube Content"),
        Reminder(title: "Update YouTube Art"),
        ], remindDate: getSampleDate(offset: 10)),
    
    ReminderData(remind:[
        Reminder(title: "plan ofr the New Year"),
        ], remindDate: getSampleDate(offset: 26)),
    
    ReminderData(remind:[
        Reminder(title: "Film YouTube content"),
        Reminder(title: "TikTok Research"),
        ], remindDate: getSampleDate(offset:22)),
    
    ReminderData(remind:[
        Reminder(title: "SwiftUI Research"),
        ], remindDate: getSampleDate(offset: 8)),
]


