//
//  SearchBar.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 08/01/25.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    // MARK: - Properties
    @Binding var searchQuery: String
    var placeholder: String = "Search"
    
    var body: some View {
        HStack {
            Image(Icons.search.rawValue)
                .foregroundColor(.gray)
                .padding(.leading, 8)
            
            TextField("Search food", text: $searchQuery)
                .font(.body)
                .padding(.leading, 7)
        }
        .frame(height: 45)
        .background(Color(UIColor.appLightGrayColor))
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.4), radius: 2, x: 0, y: 3)
        .padding(.horizontal, 21)
    }
}
