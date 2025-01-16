//
//  DropdownMenu.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 09/01/25.
//

import Foundation
import SwiftUI
struct DropdownMenu: View {
    let options: [String]
    @Binding var selectedOption: String
    let spacer : Bool 
    let textColor: Color
    let iconColor : Color
   
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                }) {
                    Text(option)
                }
            }
        } label: {
            HStack {
                Text(selectedOption)
                    .textStyle(size: 16, color: textColor, fontStyle: .interSemibold)
                spacer ?  Spacer() : nil
                Image(Icons.dropDown.rawValue)
                    .renderingMode(.template)
                    .foregroundColor(iconColor)
                    .padding(.leading, 10)
            }
        }
    }
}
