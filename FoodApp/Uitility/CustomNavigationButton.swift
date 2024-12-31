import Foundation
import SwiftUI

struct CustomNavigationButton<Destination: View>: View {
    var title: String
    var backgroundColor: Color
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 56)
                .foregroundColor(.white)
                .background(backgroundColor)
                .cornerRadius(28)
        }
        .padding(.horizontal, 34)
    }
}
