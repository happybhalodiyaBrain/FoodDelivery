import Foundation
import SwiftUI

struct CustomNavigationButton<Destination: View>: View {
    var title: String
    var backgroundColor: Color
    var destination: Destination
    var foregroundColor : Color
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 56)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .overlay(
                       RoundedRectangle(cornerRadius: 28)
                           .stroke(Color(UIColor.appOrangeColor), lineWidth: 1) // Add the border
                   )
                .cornerRadius(28)
        }
        .padding(.horizontal, 34)
    }
}
