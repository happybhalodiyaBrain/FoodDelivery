import Foundation
import SwiftUI


// MARK: - DidntReceiveLinkView

/// A reusable view that displays a message with a clickable link.
/// This view shows a message (e.g., "Didn't receive the link?") with a clickable link text (e.g., "Click Here")
/// that performs an action when tapped. It's useful for situations like password reset or verification links.
struct DidntReceiveLinkView: View {
    // MARK: - Properties
    var message: String
    var linkText: String
    var action: () -> Void
    
    // MARK: - Body
    /// The view's body that arranges the message and link text horizontally.
    var body: some View {
        HStack {
            // Message text
            Text(message)
                .font(AppFont.FontStyle.interRegular.font(size: 14))
                .foregroundColor(Color(UIColor.appSecondaryFontColor))
            // Link text
            Text(linkText)
                .font(AppFont.FontStyle.interRegular.font(size: 14))
                .foregroundColor(Color(UIColor.appOrangeColor))
                .onTapGesture {
                    action()
                }
        }
    }
}
