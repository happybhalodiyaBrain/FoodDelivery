import Foundation

/// A model representing a restaurant in the offers section.
struct OfferRestaurant: Identifiable {
    
    // MARK: - Properties
    let id = UUID()
    let imageName: String
    let name: String
    let rating: String
    let primaryCategory: String
    let secondaryCategory: String
    let ratingNumber: String
}
