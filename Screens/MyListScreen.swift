//
//  MyListScreen.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 01/02/25.
//

import SwiftUI
import SwiftData

struct MyListScreen: View {
    
    @Query private var myList: [MyList]
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List{
            Text("My List")
                .font(.largeTitle)
                .bold()
            
            ForEach(myList){ myList in
                
                NavigationLink {
                    MyListDetailScreen(myList: myList)
                } label: {
                    HStack{
                        Image(systemName: "line.3.horizontal.circle.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(Color(hex: myList.colorCode))
                        Text(myList.name)
                    }
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

#Preview { @MainActor in
    NavigationStack {
        MyListScreen()
    }.modelContainer(previewContainer)
    
}
