//
//  Date+Extensions.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 09/03/25.
//

import Foundation

extension Date {
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }

    var isTomorrow: Bool {
        let calendar = Calendar.current
        return calendar.isDateInTomorrow(self)
    }
    
    var dateComponents: DateComponents {
        Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
    }
}
