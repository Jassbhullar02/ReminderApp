//
//  AddMyListScreen.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/02/25.
//

import SwiftUI
import SwiftData

struct AddMyListScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var listName: String = ""
    @State private var color: Color = .blue
    
    var body: some View {
        VStack{
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(color)
            
            TextField("List name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 44)
            
            ColorPickerView(selectedColor: $color)
        }
        .navigationTitle("New List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss() // Close Sheet
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    
                    guard let hex = color.toHex() else { return }
                    
                    let myList = MyList(name: listName, colorCode: hex)
                    context.insert(myList)
                    dismiss() 
                }
            }
        }
    }
}

#Preview { @MainActor in
    NavigationStack{
        AddMyListScreen()
    }.modelContainer(previewContainer)
}
