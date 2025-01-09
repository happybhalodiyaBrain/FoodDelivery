//
//  RattingStar.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 09/01/25.
//

import Foundation
import SwiftUI

struct RatingStarView: View {
    var icon: String // Name of the image/icon
    var rating: String // The rating value
    var ratingNumber: String // The number of ratings
    var iconSize: CGSize = CGSize(width: 13, height: 14) // Default icon size
    var ratingColor: Color = Color(UIColor.appOrangeColor) // Color for the rating text
    var ratingNumberColor: Color = Color(UIColor.appPlaceholderColor) // Color for the rating number text
    
    var body: some View {
        HStack(spacing: 4) { // Adjust spacing as needed
            Image(icon)
                .resizable()
                .frame(width: iconSize.width, height: iconSize.height)
            
            Text(rating)
                .textStyle(size: 11, color: ratingColor, fontStyle: .interSemibold)
            
            Text(ratingNumber)
                .textStyle(size: 12, color: ratingNumberColor, fontStyle: .interSemibold)
        }
    }
}
