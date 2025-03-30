//
//  ReminderApp.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 14/03/25.
//

import SwiftUI
import UserNotifications

// The @main attribute marks the app's entry point.
@main
struct ReminderApp: App {
    
    // Initializer to request notification permissions when the app launches.
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in
            
        }
    }
    
    // The main body of the app, defining the app's scenes.
    var body: some Scene {
        WindowGroup {
            // Embedding the root view in a NavigationStack for navigation support.
            NavigationStack {
                MyListsScreen()
                
            // Set up a model container for managing MyList data.
            }.modelContainer(for: MyList.self)
        }
    }
}
