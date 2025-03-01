//
//  String+Extensions.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/03/25.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
