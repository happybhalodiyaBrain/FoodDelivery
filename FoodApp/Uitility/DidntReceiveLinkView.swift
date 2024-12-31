import Foundation
import SwiftUI

/// A reusable view that displays a message with a clickable link.
struct DidntReceiveLinkView<Destination: View>: View {
    // MARK: - Properties
    var message: String
    var linkText: String
    var destination: Destination
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(message)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.gray)
            
            NavigationLink(destination: destination) {
                Text(linkText)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.orange)
            }
        }
    }
}
