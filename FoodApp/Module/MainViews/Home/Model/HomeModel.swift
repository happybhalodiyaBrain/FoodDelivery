import Foundation

struct CategoryItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct RestaurantItem: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let rating: String
    let category: String
    let ratingNumber: String
}
