//
//  MyList.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 27/02/25.
//

import Foundation
import SwiftData

@Model
class MyList {
    
    // MARK: - Variables
    var name: String = ""
    var colorCode: String = "#34C759"
    
    @Relationship(deleteRule: .cascade)
    var reminders: [Reminder]?
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
