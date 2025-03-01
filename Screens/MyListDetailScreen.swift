//
//  MyListDetailScreen.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/03/25.
//

import SwiftUI
import SwiftData

struct MyListDetailScreen: View {
    
    var myList: MyList
    @State private var title: String = ""
    @State private var isNewReminderPresented: Bool = false
    
    private func saveReminder() {
        let reminders = Reminder(title: title)
        myList.reminders.append(reminders)
        title = ""
    }
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhitespace
    }
    
    var body: some View {
        VStack{
            List(myList.reminders) { reminder in
//                Text(reminder.title)  
                ReminderCellView(reminder: reminder, isSelected: false) { event in
                    switch event {
                    case .onChecked(let reminder, let checked):
                        print("onChecked")
                    case .onSelect(let reminder):
                        print("onSelect")
                    case .onInfoSelected(let reminder):
                        print("onInfoSelected")
                    }
                    
                }
            }
            Spacer()
            Button {
                isNewReminderPresented = true
            } label: {
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("New Reminder")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()

        }.navigationTitle(myList.name)
            .alert("New Reminder", isPresented: $isNewReminderPresented) {
                TextField("", text: $title)
                Button("Cancel", role: .cancel) {}
                Button("Done") {
                    saveReminder()
                }.disabled(!isFormValid)
            }
    }
    
}

struct MyListDetailScreenContainer: View {
    
    @Query private var myLists: [MyList]
    
    var body: some View {
        MyListDetailScreen(myList: myLists[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListDetailScreenContainer()
    }
        .modelContainer(previewContainer)
}
