import SwiftUI

struct FoodItemView: View {
    let foodItem: FoodItem
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background Image
            Image(foodItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200) // Set height of the card
                .clipped()
            
            // Gradient Overlay
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(maxWidth: .infinity, maxHeight: 103)
            
            
            // Text Content
            VStack(alignment: .leading, spacing: 5) {
                Text(foodItem.title)
                    .textStyle(size: 16, color: Color(UIColor.appWhiteColor),
                               fontStyle: .interBold)
                
                HStack{
                    RatingStarView(
                        icon: Icons.star.rawValue,
                        rating: foodItem.rating,
                        ratingNumber: ""
                    )
                    ProductCategory(
                        primaryCategory: foodItem.primaryCategory,
                        secondaryCategory: foodItem.secondaryCategory,
                        textColor: Color(UIColor.appWhiteColor)
                    )
                }
            }
            .padding(.horizontal, 21)
            .padding(.bottom, 21)
        }
        .frame(height: 193)
        
    }
}

#Preview {
    FoodItemView(foodItem: FoodItem( title: "French Apple Pie", imageName: MenuLists.menuList1.rawValue, rating: "4.1", primaryCategory: "9 Minute", secondaryCategory: "Desserts"))
}
