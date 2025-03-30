//
//  String+Extensions.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/03/25.
//

import Foundation

/// Checks if the string is either empty or contains only whitespace and newlines.
extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
