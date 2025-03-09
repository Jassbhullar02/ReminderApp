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
    @State private var selectedList: MyList?
    
    @State private var actionSheet: MyListScreenSheets?
    
    enum MyListScreenSheets: Identifiable {
        case newList
        case editList(MyList)
        
        var id: Int {
            switch self {
            case .newList:
                return 1
            case .editList(let myList):
                return myList.hashValue
            }
        }
        
    }
    
    var body: some View {
        List{
            Text("My List")
                .font(.largeTitle)
                .bold()
            
            ForEach(myList){ myList in
                
                NavigationLink {
                    MyListDetailScreen(myList: myList)
                } label: {
                    MyListCellView(myList: myList)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedList = myList
                        }
                        .onLongPressGesture(minimumDuration: 0.5) {
                            actionSheet = .editList(myList)
                        }
                }
            }
            
            Button {
                actionSheet = .newList
            } label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .listRowSeparator(.hidden)
            
        }
        .navigationDestination(item: $selectedList, destination: { myList in
            Text(myList.name)
        })
        
        .listStyle(.plain)
        .sheet(item: $actionSheet) { actionSheet in
            switch actionSheet {
            case .newList:
                NavigationStack {
                    AddMyListScreen()
                }
            case .editList(let myList):
                NavigationStack {
                    AddMyListScreen(myList: myList)
                }
            }
        }
    }
}

#Preview { @MainActor in
    NavigationStack {
        MyListScreen()
    }.modelContainer(previewContainer)
    
}
