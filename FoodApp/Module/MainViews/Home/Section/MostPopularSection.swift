import Foundation
import SwiftUI

/// A view that displays a horizontal scrolling list of most popular restaurants.
struct MostPopularSection: View {
    /// The list of most popular restaurants to display.
    let mostPopularSection: [RestaurantItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(mostPopularSection) { restaurant in
                    VStack(alignment: .leading) {
                        // GeometryReader used to make the image responsive
                        GeometryReader { geometry in
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .cornerRadius(10)
                                .clipped()
                        }
                        .frame(width: 228, height: 135)
                        VStack(alignment: .leading){
                            // Restaurant name
                            Text(restaurant.name)
                                .textStyle(size: 18, color: Color(UIColor.appDarkGeryColor),
                                           fontStyle: .interSemibold)
                            
                            // Category and rating
                           
                                ProductCategory(
                                    primaryCategory: restaurant.primaryCategory,
                                    secondaryCategory: restaurant.secondaryCategory
                                )
                                RatingStarView(
                                    icon: Icons.star.rawValue,
                                    rating: restaurant.rating,
                                    ratingNumber: restaurant.ratingNumber
                                )
                                
                        }.appTopPadding(11)
                    }
                }
            }.padding(.horizontal, 21)
        }
    }
}
