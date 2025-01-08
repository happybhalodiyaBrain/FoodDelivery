
import Foundation

/// A model representing a menu item in the app.
struct MenuModel: Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier for the menu item.
    let id = UUID()
    /// The name of the image associated with the menu item.
    let imageName: String
    /// The title of the menu item (e.g., Food, Beverages).
    let title: String
    /// A description or count of items in the menu section.
    let items: String
}
