//
//  ReminderListView.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 12/03/25.
//

import SwiftUI
import SwiftData

struct ReminderListView: View {
    
    // MARK: - Variables
    let reminders: [Reminder]
    @Environment(\.modelContext) private var context
    
    @State private var selectedReminder: Reminder? = nil
    @State private var showReminderEditScreen: Bool = false
    
    @State private var reminderIdAndDelay: [PersistentIdentifier: Delay] = [:]
    
    // MARK: - Private functions
    private func deleteReminder(_ indexSet: IndexSet) {
        guard let index = indexSet.last else { return }
        let reminder = reminders[index]
        context.delete(reminder)
    }
    
    var body: some View {
        List {
            ForEach(reminders) { reminder in
                ReminderCellView(reminder: reminder) { event in
                    switch event {
                    case .onChecked(let reminder, let checked):
                            
                        // get the delay from the dictionary
                        var delay = reminderIdAndDelay[reminder.persistentModelID]
                            if let delay {
                                // cancel
                                delay.cancel()
                                reminderIdAndDelay.removeValue(forKey: reminder.persistentModelID)
                                
                            } else {
                                // create a new delay and add to the dictionary
                                delay = Delay()
                                reminderIdAndDelay[reminder.persistentModelID] = delay
                                delay?.performWork {
                                    reminder.isCompleted = checked
                                }
                            }
                            
                    case .onSelect(let reminder): // for editing
                        selectedReminder = reminder
                    }
                }
            }.onDelete(perform: deleteReminder)
        }.sheet(item: $selectedReminder, content: { selectedReminder in
            NavigationStack {
                ReminderEditScreen(reminder: selectedReminder)
            }
        })
    }
}
