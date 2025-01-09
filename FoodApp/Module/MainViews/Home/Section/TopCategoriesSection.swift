import Foundation
import SwiftUI

/// A view that displays a horizontal scrolling list of top categories.
struct TopCategoriesSection: View {
    /// The list of category items to display.
    let categories: [CategoryItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 18) {
                ForEach(categories) { category in
                    VStack {
                        GeometryReader { geometry in
                            Image(category.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width, height: geometry.size.width) // Ensures square aspect ratio
                        }
                        .frame(width: 88, height: 88)
                        
                        // Category title
                        Text(category.title)
                            .textStyle(size: 14, color: Color(UIColor.appDarkGeryColor), fontStyle: .interSemibold)
                    }
                }
            }.padding(.top, 30)
                .padding(.horizontal, 21)
        }
    }
}
