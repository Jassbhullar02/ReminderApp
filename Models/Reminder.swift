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
    
    // MARK: - Variables
    var title: String = ""
    var notes: String?
    var isCompleted: Bool = false
    var reminderDate: Date?
    var reminderTime: Date?
    
    var list: MyList?
    
    init(title: String, notes: String? = nil, isCompleted: Bool = false, reminderDate: Date? = nil, remminderTime: Date? = nil, list: MyList? = nil) {
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
        self.reminderDate = reminderDate
        self.reminderTime = remminderTime
        self.list = list
    }
    
}
