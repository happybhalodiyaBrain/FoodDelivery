import Foundation
import SwiftUI

/// A custom text field that handles both secure and regular inputs with styling.
struct CustomTextField: View {
    
    // MARK: - Properties
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    // MARK: - Body
    var body: some View {
        // TextField or SecureField based on isSecure flag
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding()
                    .background(Color(UIColor.appLightGrayColor))
                    .cornerRadius(28)
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .background(Color(UIColor.appLightGrayColor))
                    .cornerRadius(28)
            }
        }
    }
}
