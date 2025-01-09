//
//  RecentItemsSection.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 09/01/25.
//

import Foundation
import SwiftUI

/// A view that displays a list of recently viewed or ordered items.
struct RecentItemsSection: View {
    /// The list of recent items to display.
    let recentItemsSection: [RestaurantItem]
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(recentItemsSection) { restaurant in
                HStack {
                    // GeometryReader used to make the image responsive
                                       GeometryReader { geometry in
                                           Image(restaurant.imageName)
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: geometry.size.width, height: geometry.size.height)
                                               .cornerRadius(10)
                                               .clipped()
                                       }.frame(width: 75, height: 75)
                    // Restaurant details
                    VStack(alignment: .leading, spacing: 5) {
                        // Restaurant name
                        Text(restaurant.name)
                            .textStyle(size: 18, color: Color(UIColor.appDarkGeryColor),
                                       fontStyle: .interSemibold)
                        
                        HStack{
                            // Restaurant category
                            ProductCategory(
                                primaryCategory: restaurant.primaryCategory,
                                secondaryCategory: restaurant.secondaryCategory
                            )
                        }
                        // Rating and number of reviews
                        RatingStarView(
                            icon: Icons.star.rawValue,
                            rating: restaurant.rating,
                            ratingNumber: restaurant.ratingNumber
                        )

                    }.padding(.leading, 22)
                    Spacer()
                }
            }
        }.padding(.horizontal, 21)
        
    }
}
