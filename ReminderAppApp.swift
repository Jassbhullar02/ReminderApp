//
//  ReminderAppApp.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 11/02/25.
//

import SwiftUI

@main
struct ReminderAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MyListScreen()
            }.modelContainer(for: MyList.self)
           
        }
    }
}
