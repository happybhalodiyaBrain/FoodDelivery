import Foundation
import SwiftUI

/// A custom social media button with adjustable title, icon, background color, and action.
struct SocialMediaButton: View {
    
    // MARK: - Properties
    var title: String
    var image: String
    var backgroundColor: Color
    var action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            HStack {
                Image(image)
                    .foregroundColor(Color(UIColor.appWhiteColor))
                Text(title)
                    .padding(.leading, 26)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .cornerRadius(28)
        }
    }
}