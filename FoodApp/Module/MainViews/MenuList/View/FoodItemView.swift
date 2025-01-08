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
                    Image(Icons.star.rawValue)
                        .frame(width: 10, height: 10)
                    Text("2.0")
                        .textStyle(size: 11, color: Color(UIColor.appOrangeColor),
                                   fontStyle: .interSemibold)
                    
                    Text(foodItem.category1)
                        .textStyle(size: 12, color: Color(UIColor.appWhiteColor),
                                   fontStyle: .interSemibold)
                    Image(AppImages.dot.rawValue)
                        .frame(width: 10, height: 10)
                    Text(foodItem.category2)
                        .textStyle(size: 12, color: Color(UIColor.appWhiteColor),
                                   fontStyle: .interSemibold)
                    
                }
            }
            .padding(.horizontal, 21)
            .padding(.bottom, 21)
        }
        .frame(height: 193)
        
    }
}

#Preview {
    FoodItemView(foodItem: FoodItem( title: "French Apple Pie", imageName: MenuLists.menuList1.rawValue, rating: 4.1, category1: "9 Minute", category2: "Desserts"))
}
