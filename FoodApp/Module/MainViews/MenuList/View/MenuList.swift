//
//  MenuList.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 08/01/25.
//

import SwiftUI
/// The `MenuList` view displays a list of food items in a menu, with the ability to search and navigate back to the previous screen.

struct MenuList: View {
    
    // MARK: - Properties
    
    /// The title of the menu to be displayed in the header.
    var title: String
    /// The search query entered by the user.
    @State private var searchQuery = ""
    /// The view model responsible for providing the food items.
    @StateObject private var viewModel = FoodViewModel()
    
    
    var body: some View {
        VStack {
            // MARK: - Header View
            
            // Header view displaying the menu title.
            VStack {
                CustomHeaderView(
                    showBackArrow: true,
                    greetingText: title,
                    onBackTapped: {
                        NavigationService.shared.pop()
                    }
                )
            }
            
            // MARK: - Search Bar
            
            // A search bar to filter food items by the search query
            SearchBar(searchQuery: $searchQuery, placeholder: "Search food")
                .padding(.top, 25)
            
            // MARK: - Food Items List
            
            // A scrollable list of food items, filtered by the search query
            ScrollView {
                VStack {
                    // For each food item in the view model, create a FoodItemView
                    
                    ForEach(viewModel.foodItems) { item in
                        FoodItemView(foodItem: item)
                    }
                    .padding(.bottom, 4)
                }
                
            }.appTopPadding(19)
            
        }
        // MARK: - Navigation Bar Customization
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Preview
#Preview {
    MenuList(title: "Dessert")
}
