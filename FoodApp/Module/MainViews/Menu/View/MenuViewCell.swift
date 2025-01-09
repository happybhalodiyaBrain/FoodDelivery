import Foundation
import SwiftUI

struct MenuViewCell: View {
    // MARK: - Properties
    let menuItem: MenuModel
    var action: () -> Void
    // MARK: - Body
    var body: some View {
        ZStack {
            // Background
            Image(MenuLists.rectangle.rawValue)
                .resizable()
                .frame(height: 87)
            HStack {
                // MARK: - Menu Item Details
                HStack {
                    /// Menu Item Image
                    Image(menuItem.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .padding(.leading,-30)
                    /// Title and Items Count
                    VStack(alignment: .leading,spacing: 3) {
                       
                        Text(menuItem.title)
                            .textStyle(size: 22, color: Color(UIColor.appDarkGeryColor),
                                       fontStyle: .interSemibold)
                        Text("\(menuItem.items) Items")
                            .textStyle(size: 11, color: Color(UIColor.appPlaceholderColor),
                                       fontStyle: .interSemibold)
                    }
                    .padding()
                }
                Spacer()
                // MARK: - Navigation Button
                Button(action: action) {
                    Image(Icons.forward.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33,height: 33)
                }
                .padding(.trailing, -5)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    MenuViewCell(menuItem: MenuModel(imageName: MenuLists.food.rawValue, title: "Food", items: "120"), action: {})
}
