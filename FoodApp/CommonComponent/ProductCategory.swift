//
//  ProductCategory.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 09/01/25.
//

import Foundation
import SwiftUI

struct ProductCategory: View {
    var primaryCategory: String // Primary category text
    var secondaryCategory: String // Secondary category text
    var textColor: Color = Color(UIColor.appPlaceholderColor) // Text color
    var dotImage: String = AppImages.dot.rawValue // Dot image name
    var dotSize: CGSize = CGSize(width: 5, height: 5) // Dot size
    
    var body: some View {
        HStack(spacing: 4) { // Adjust spacing as needed
            Text(primaryCategory)
                .textStyle(size: 12, color: textColor, fontStyle: .interSemibold)
            
            Image(dotImage)
                .resizable()
                .frame(width: dotSize.width, height: dotSize.height)
            
            Text(secondaryCategory)
                .textStyle(size: 12, color: textColor, fontStyle: .interSemibold)
        }
    }
}
