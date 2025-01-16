import Foundation


class OffersViewModel: ObservableObject {
    
    // MARK: - Published Properties
    /// A list of restaurants displayed in the offers section.
    @Published var restaurants: [RestaurantItem] = []
    
    // MARK: - Initializer
    
    /// Initializes the `OffersViewModel` and loads sample data.
    init() {
        loadSampleData()
    }
    
    // MARK: - Private Methods
    
    /// Simulates loading sample data for categories and restaurants.
    private func loadSampleData() {
        // Categories Data
        restaurants = [
            RestaurantItem(imageName: offersImages.offers1.rawValue, name: "Minute by tuk tuk", rating: "4.9", primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: offersImages.offers2.rawValue, name: "Café de Noir", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: offersImages.offers3.rawValue, name: "Bakes by Tella", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)")
        ]
        
    }
}
