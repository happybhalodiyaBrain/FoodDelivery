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
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
            
            Text(linkText)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.orange)
                .onTapGesture {
                    action()
                }
        }
    }
}
