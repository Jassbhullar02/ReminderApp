//
//  Reminder.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/03/25.
//

import Foundation
import SwiftData

@Model
class Reminder {
    
    var title: String
    var notes: String?
    var isCompleted: Bool
    var remiderDate: Date?
    var reminderTime: Date?
    
    var list: MyList?
    
    init(title: String, note: String? = nil, isCompleted: Bool = false, remiderDate: Date? = nil, reminderTime: Date? = nil, list: MyList? = nil) {
        self.title = title
        self.notes = note
        self.isCompleted = isCompleted
        self.remiderDate = remiderDate
        self.reminderTime = reminderTime
        self.list = list
    }
    
    
    
}

