import Foundation
import SwiftUI


/// A view that displays a list of popular restaurants.
struct PopularRestaurantsSection: View {
    
    /// The list of popular restaurants to display.
    let popularRestaurants: [RestaurantItem]
    
    var body: some View {
        
        VStack(spacing:31) {
            ForEach(popularRestaurants) { restaurant in
                VStack {
                    // GeometryReader used to make the image responsive
                    GeometryReader { geometry in
                        Image(restaurant.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                    .frame(height: 193)
                    
                    // Restaurant details
                    VStack(alignment: .leading, spacing: 5) {
                        // Restaurant name
                        Text(restaurant.name)
                            .textStyle(size: 16, color: Color(UIColor.appDarkGeryColor),
                                       fontStyle: .interSemibold)
                        // Rating and category information
                        HStack {
                            RatingStarView(
                                icon: Icons.star.rawValue,
                                rating: restaurant.rating,
                                ratingNumber: restaurant.ratingNumber
                            )
                            ProductCategory(
                                primaryCategory: restaurant.primaryCategory,
                                secondaryCategory: restaurant.secondaryCategory
                            )
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 21)
                        .padding(.top, 5)
                }
            }
        }
    }
}
