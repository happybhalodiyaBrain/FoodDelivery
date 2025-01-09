import Foundation

/// Represents a category item with an image and title.
struct CategoryItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

/// Represents a restaurant item with details like name, rating, and categories.
struct RestaurantItem: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let rating: String
    let primaryCategory: String
    let secondaryCategory: String
    let ratingNumber: String
}
