//
//  MyListScreen.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/02/25.
//

import SwiftUI

struct MyListScreen: View {
    
    var mylist = ["Reminders","Groceries", "Entertainment"]
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List{
            Text("My List")
                .font(.largeTitle)
                .bold()
            
            ForEach(mylist, id: \.self){ item in
                HStack{
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .font(.system(size: 32))
                    Text(item)
                }
            }
            
            Button {
                isPresented = true
            } label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .listRowSeparator(.hidden)
            
        }.listStyle(.plain)
            .sheet(isPresented: $isPresented, content: {
                NavigationStack{
                    AddMyListScreen()
                }
            })
    }
}

#Preview {
    MyListScreen()
}
