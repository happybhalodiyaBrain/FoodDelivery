import Foundation
import SwiftUI

// MARK: - Text Extensions
/// Extension for styling `Text` views with app-specific styles.
extension Text {
    
    /// - This style uses a large title font, regular font weight, and the dark gray color for text.
    func appTitleStyle() -> some View {
        self.font(AppFont.FontStyle.interRegular.font(size: 30))
            .foregroundColor(Color(UIColor.appDarkGeryColor))
            .multilineTextAlignment(.center)
    }
    /// - This style uses a subheadline font and the secondary font color for text.
    func appSubtitleStyle() -> some View {
        self.font(AppFont.FontStyle.interRegular.font(size: 14))
            .foregroundColor(Color(UIColor.appSecondaryFontColor))
            .multilineTextAlignment(.center)
            .appHorizontalPadding(55)
    }
}

// MARK: - View Extensions
/// Extension for adding custom padding to `View` elements.
extension View {
    /// - Parameter value: The amount of horizontal padding to apply.
    func appHorizontalPadding(_ value: CGFloat) -> some View {
        self.padding(.horizontal, value)
    }
    
    /// - Parameter value: The amount of top padding to apply.
    func appTopPadding(_ value: CGFloat) -> some View {
        self.padding(.top, value)
    }
}

// MARK: - UIApplication Extension
/// Extension for dismissing the keyboard when tapped outside a text field.
extension UIApplication {
    /// Dismisses the keyboard in the app by ending editing in the first window.
    func endEditing() {
        if let windowScene = connectedScenes.first as? UIWindowScene {
                   windowScene.windows.first?.endEditing(true)
               }
    }
}


