import Foundation
import Combine

/// ViewModel for managing the menu details and customization state.
class MenuDetailsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var selectedSize: String = "Select the size of portion"
    @Published var selectedIngredient: String = "Select the ingredients"
    @Published var portionCount: Int = 2
    @Published var totalPrice: String = "LKR 1500"
    
    // MARK: - Options
    let sizeOptions = ["Small", "Medium", "Large"]
    let ingredientOptions = ["Cheese", "Chicken", "Vegetables"]
    
    /// Increments the portion count by 1.
    func incrementPortionCount() {
        portionCount += 1
    }
    
    /// Decrements the portion count by 1, ensuring it doesn't go below 1.
    func decrementPortionCount() {
        if portionCount > 1 {
            portionCount -= 1
        }
    }
    
    /// Handles the navigation to the previous screen.
    /// This is typically used when a back button is pressed.
    func onNavigateToBack() {
        NavigationService.shared.pop()
    }
}
