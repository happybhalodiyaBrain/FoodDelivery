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
    /// The view's body that defines the appearance of the social media button.
    var body: some View {
            Button(action: action) {
                HStack {
                    // Icon
                    Image(image)
                        .foregroundColor(Color(UIColor.appWhiteColor))
                    // Title text
                    Text(title)
                        .textStyle(size: 12, color: Color(UIColor.appWhiteColor),fontStyle: .interRegular)
                        .padding(.leading, 26)
                }
                .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56) // Fixed height
                .padding(.horizontal)
                .background(backgroundColor)
                .cornerRadius(28)
            }
        }
    }
