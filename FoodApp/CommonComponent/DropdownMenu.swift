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
                    .textStyle(size: 16, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interSemibold)
                
                Image(Icons.dropDown.rawValue)
                    .padding(.leading, 10)
            }
        }
    }
}
