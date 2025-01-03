import Foundation
import SwiftUI

/// A custom text field that handles both secure and regular inputs with styling.
struct CustomTextField: View {
    
    // MARK: - Properties
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    // MARK: - Body
    var body: some View {
        // TextField or SecureField based on isSecure flag
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .frame(height: 56)
                    .padding([.leading, .trailing],34)
                    .background(Color(UIColor.appLightGrayColor))
                    .keyboardType(keyboardType)
                    .cornerRadius(28)
                    .padding([.leading, .trailing],34)
            } else {
                TextField(placeholder, text: $text)
                    .frame(height: 56)
                    .padding([.leading, .trailing],34)
                    .background(Color(UIColor.appLightGrayColor))
                    .keyboardType(keyboardType)
                    .cornerRadius(28)
                    .padding([.leading, .trailing],34)
            }
        }
    }
}
