//
//  ReminderCellView.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/03/25.
//

import SwiftUI
import SwiftData

enum ReminderCellEvents {
    case onChecked(Reminder, Bool)
    case onSelect(Reminder)
    case onInfoSelected(Reminder)
}

struct ReminderCellView: View {
    
    let reminder: Reminder
    let isSelected: Bool
    let onEvent: (ReminderCellEvents) -> Void
    @State private var checked: Bool = false
    
    var body: some View {
        HStack(alignment: .top) {
            
            Image(systemName: "circule")
                .font(.title2)
                .padding([.trailing], 5)
                .onTapGesture {
                    checked.toggle()
//                    reminder.isCompleted.toggle()
                    onEvent(.onChecked(reminder, checked))
                }
            
            VStack {
                Text(reminder.title)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                if let notes = reminder.note {
                    Text(notes)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    if let reminderDate = reminder.remiderDate {
                        Text(reminderDate.formatted())
                    }

                    if let reminderTime = reminder.reminderTime {
                        Text(reminderTime.formatted())
                    }
                }.font(.caption)
                  .foregroundStyle(.gray)
                  .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            Image(systemName: "info.circle.fill")
                .opacity(isSelected ? 1 : 0)
                .onTapGesture {
                    onEvent(.onInfoSelected(reminder))
                }
            
        }.contentShape(Rectangle())
            .onTapGesture {
                onEvent(.onSelect(reminder))
            }
    }
}

struct ReminderCellViewContainer: View {

    @Query(sort: \Reminder.title) private var reminders: [Reminder]
    
    var body: some View {
        ReminderCellView(reminder: reminders[0], isSelected: false) { _ in
            
        }
    }
}

#Preview { @MainActor in
    ReminderCellViewContainer()
        .modelContainer(previewContainer)
}
