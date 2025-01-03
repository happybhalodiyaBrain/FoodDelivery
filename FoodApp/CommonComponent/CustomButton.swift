import Foundation
import SwiftUI

/// A custom button with adjustable title, background color, and action.
struct CustomButton: View {
    // MARK: - Properties
    var title: String
    var backgroundColor: Color
    var action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 56)
                .font(AppFont.FontStyle.interRegular.font(size: 16))
                .foregroundColor(Color(UIColor.appWhiteColor))
                .background(backgroundColor)
                .cornerRadius(28)
        }
    }
}
