import Foundation
import SwiftUI

/// A reusable view that displays a message with a clickable link.
struct DidntReceiveLinkView: View {
    // MARK: - Properties
    var message: String
    var linkText: String
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(message)
                .font(AppFont.FontStyle.interRegular.font(size: 14))
                .foregroundColor(Color(UIColor.appSecondaryFontColor))
            
            Text(linkText)
                .font(AppFont.FontStyle.interRegular.font(size: 14))
                .foregroundColor(Color(UIColor.appOrangeColor))
                .onTapGesture {
                    action()
                }
        }
    }
}
