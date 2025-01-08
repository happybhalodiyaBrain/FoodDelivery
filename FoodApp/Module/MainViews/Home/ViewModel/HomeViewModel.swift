import Foundation


class HomeViewModel: ObservableObject {
    // Categories Data
    @Published var categories: [CategoryItem] = []
    
    // Popular Restaurants Data
    @Published var popularRestaurants: [RestaurantItem] = []
    
    // Most Popular Restaurants Data
    @Published var mostPopularRestaurants: [RestaurantItem] = []
    
    // Recent Items Data
    @Published var recentItems: [RestaurantItem] = []
    
    init() {
        loadSampleData()
    }
    
    private func loadSampleData() {
        // Simulating sample data
        categories = [
            CategoryItem(imageName: MenuItem.category1.rawValue, title: "Offers"),
            CategoryItem(imageName: MenuItem.category2.rawValue, title: "Sri Lankan"),
            CategoryItem(imageName: MenuItem.category3.rawValue, title: "Italian"),
            CategoryItem(imageName: MenuItem.category1.rawValue, title: "Indian")
        ]
        
        popularRestaurants = [
            RestaurantItem(imageName:MenuItem.popular1.rawValue, name: "Minute by tuk tuk", rating: "4.9", category: "Cafe • Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.popular2.rawValue, name: "Café de Noir", rating: "4.9", category: "Cafe • Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.popular3.rawValue, name: "Bakes by Tella", rating: "4.9", category: "Cafe • Western Food", ratingNumber: "(124 Ratings)")
        ]
        
        mostPopularRestaurants = [
            RestaurantItem(imageName: MenuItem.mostPopular.rawValue, name: "Café De Bambaa", rating: "4.9", category: "Cafe • Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.mostPopular.rawValue, name: "Burger by Bistro", rating: "4.9", category: "Cafe • Western Food", ratingNumber: "(124 Ratings)")
        ]
        
        recentItems = [
            RestaurantItem(imageName: MenuItem.recent2.rawValue, name: "Mulberry Pizza by Josh", rating: "4.9", category: "Cafe • Western Food", ratingNumber: "(124 Ratings)"),
            RestaurantItem(imageName: MenuItem.recent1.rawValue, name: "Barista", rating: "4.9", category: "Cafe • Coffee", ratingNumber: "(144 Ratings)"),
            RestaurantItem(imageName: MenuItem.recent3.rawValue, name: "Pizza Rush Hour", rating: "4.9", category: "Cafe • Italian Food", ratingNumber: "(134 Ratings)")
        ]
    }
}
