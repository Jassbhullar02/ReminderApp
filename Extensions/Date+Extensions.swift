//
//  Date+Extensions.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 09/03/25.
//

import Foundation

extension Date {
    
    /// Checks if the date is today.
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }

    /// Checks if the date is tomorrow.
    var isTomorrow: Bool {
        let calendar = Calendar.current
        return calendar.isDateInTomorrow(self)
    }
    
    /// Extracts the year, month, day, hour, and minute components from the date.
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
    }
}
