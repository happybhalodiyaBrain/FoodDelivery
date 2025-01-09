import Foundation

// MARK: - FoodItem Model
/// A data model representing a food item with its details.
struct FoodItem: Identifiable {
    // MARK: - Properties
    /// A unique identifier for the food item.
    let id = UUID()
    /// The title or name of the food item.
    let title: String
    /// The image name used to display the food item in the UI.
    let imageName: String
    /// The rating of the food item (e.g., 4.5 out of 5).
    let rating: String
    /// The primary category of the food item (e.g., "Desserts").
    let primaryCategory: String
    /// The secondary category of the food item (e.g., "Snacks").
    let secondaryCategory: String
}
