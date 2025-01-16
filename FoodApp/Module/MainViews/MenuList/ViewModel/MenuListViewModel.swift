//
//  MenuListViewModel.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 08/01/25.
//

import Foundation

// MARK: - FoodViewModel
/// A view model for managing and providing a list of food items to the views
class MenuListViewModel: ObservableObject {
    // MARK: - Published Properties
    /// A list of food items to be displayed in the app.
    @Published var foodItems: [MenuListModel] = [
        MenuListModel(title: AppStrings.menuList1, imageName: MenuLists.menuList1.rawValue, rating: "4.1", primaryCategory: AppStrings.listCategory, secondaryCategory: AppStrings.desserts),
        MenuListModel(title: AppStrings.menuList2, imageName: MenuLists.menuList2.rawValue, rating: "3.75", primaryCategory: AppStrings.listCategory, secondaryCategory: AppStrings.desserts),
        MenuListModel(title: AppStrings.menuList3, imageName: MenuLists.menuList3.rawValue, rating: "4.9", primaryCategory: AppStrings.listCategory, secondaryCategory: AppStrings.desserts),
        MenuListModel(title: AppStrings.menuList4, imageName: MenuLists.menuList4.rawValue, rating: "4.9", primaryCategory: AppStrings.listCategory, secondaryCategory: AppStrings.desserts)
    ]
    
    func onNavigateToMenuDetails () {
        NavigationService.shared.push(to: .tabbar(.menu(.menuDetail)))
    }
}
