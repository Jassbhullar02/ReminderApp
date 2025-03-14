//
//  ReminderApp.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 14/03/25.
//

import SwiftUI
import UserNotifications

@main
struct ReminderApp: App {
    
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
            
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListsScreen()
            }.modelContainer(for: MyList.self)
        }
    }
}
