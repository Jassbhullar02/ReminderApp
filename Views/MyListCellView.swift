//
//  MyListCellView.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 09/03/25.
//

import SwiftUI

struct MyListCellView: View {
    // MARK: - Variables
    let myList: MyList
    
    var body: some View {
        HStack{
            Image(systemName: "line.3.horizontal.circle.fill")
                .font(.system(size: 32))
                .foregroundStyle(Color(hex: myList.colorCode))
            Text(myList.name)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
