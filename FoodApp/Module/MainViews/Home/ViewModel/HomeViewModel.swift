import Foundation

/// ViewModel for the home screen that manages the data for categories, popular restaurants, most popular restaurants, and recent items.

class HomeViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// locations array
    let locations: [String] = [
            AppStrings.location.currentLocation,
            AppStrings.location.home,
            AppStrings.location.work,
            AppStrings.location.other
        ]
    
    /// List of categories to display.
    @Published var categories: [CategoryItem] = []
    
    /// List of popular restaurants to display.
    @Published var popularRestaurants: [RestaurantItem] = []
    
    /// List of most popular restaurants to display.
    @Published var mostPopularRestaurants: [RestaurantItem] = []
    
    /// List of recent items to display.
    @Published var recentItems: [RestaurantItem] = []
    
   
    // MARK: - Initialization
       
    /// Initializes the HomeViewModel and loads sample data.
    init() {
        loadSampleData()
    }
    
    // MARK: - Private Methods
       
       /// Simulates loading sample data for categories and restaurants.
    private func loadSampleData() {
        // Categories Data
        categories = [
            CategoryItem(imageName: MenuItem.category1.rawValue, title: "Offers"),
            CategoryItem(imageName: MenuItem.category2.rawValue, title: "Sri Lankan"),
            CategoryItem(imageName: MenuItem.category3.rawValue, title: "Italian"),
            CategoryItem(imageName: MenuItem.category1.rawValue, title: "Indian")
        ]
        // Popular Restaurants Data
        popularRestaurants = [
            RestaurantItem(imageName:MenuItem.popular1.rawValue, name: "Minute by tuk tuk", rating: "4.9", primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.popular2.rawValue, name: "Café de Noir", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.popular3.rawValue, name: "Bakes by Tella", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)")
        ]
        // Most Popular Restaurants Data
        mostPopularRestaurants = [
            RestaurantItem(imageName: MenuItem.mostPopular.rawValue, name: "Café De Bambaa", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.mostPopular.rawValue, name: "Burger by Bistro", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)")
        ]
        // Recent Items Data
        recentItems = [
            RestaurantItem(imageName: MenuItem.recent2.rawValue, name: "Mulberry Pizza by Josh", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.recent1.rawValue, name: "Barista", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(144 Ratings)"),
            RestaurantItem(imageName: MenuItem.recent3.rawValue, name: "Pizza Rush Hour", rating: "4.9",primaryCategory: "Cafe", secondaryCategory: "Western Food", ratingNumber: "(134 Ratings)")
        ]
    }
}
