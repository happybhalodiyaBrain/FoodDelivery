import Foundation

/// ViewModel for managing the Menu data and navigation logic.
class MenuViewModel: ObservableObject {
    
    // MARK: - Properties
    /// A list of menu items to be displayed in the app.
    let menuItems: [MenuModel] = [
        MenuModel(imageName: MenuLists.food.rawValue, title: AppStrings.food, items: AppStrings.Items120),
        MenuModel(imageName: MenuLists.beverages.rawValue, title: AppStrings.beverages, items: AppStrings.Items220),
        MenuModel(imageName: MenuLists.desserts.rawValue, title: AppStrings.desserts, items: AppStrings.Items155),
        MenuModel(imageName: MenuLists.promotions.rawValue, title: AppStrings.promotions, items: AppStrings.Items25),
    ]
    
    // MARK: - Navigation Methods
    
    /// Navigates to the menu list screen based on the provided title.
    /// - Parameter title: The title of the menu list to navigate to.
    func onNavigateToMenuList (title: String) {
        NavigationService.shared.push(to: .tabbar(.menu(.menuList(title: title))))
    }
}


