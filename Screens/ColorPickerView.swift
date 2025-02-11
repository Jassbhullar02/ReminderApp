//
//  ColorPickerView.swift
//  ReminderApp
//
//  Created by Jaspreet Bhullar on 02/02/25.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 40, height: 40)
                        .padding(2)
                    
                    if selectedColor == color {
                        Circle()
                            .strokeBorder(.gray, lineWidth: 4)
                            .frame(width: 46, height: 46)
                    }
                }
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
    }
}

#Preview {
    ColorPickerView(selectedColor: .constant(.yellow))
}
