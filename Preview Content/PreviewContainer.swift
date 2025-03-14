//
//  PreviewContainer.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 27/02/25.
//
import Foundation
import SwiftData

@MainActor
var previewContainer: ModelContainer = {
    
    let container = try! ModelContainer(for: MyList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for myList in SampleData.myLists {
        container.mainContext.insert(myList)
        myList.reminders = SampleData.Reminders
    }
    
    return container
}()

struct SampleData {
    
    static var myLists: [MyList] {
        return [MyList(name: "Groceries", colorCode: "#2ecc71"), MyList(name: "Backlog", colorCode: "#9b59b6")]
    }
    
    static var Reminders: [Reminder] {
        return [Reminder(title: "Reminder 1", notes: "This is a reminder 1 note", reminderDate: Date(),remminderTime: Date()), Reminder(title: "Reminder 2", notes: "This is a reminder 2 note")]
    }
}
