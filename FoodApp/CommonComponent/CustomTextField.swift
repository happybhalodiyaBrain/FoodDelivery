import Foundation
import SwiftUI


// MARK: - Custom Text Field

/// A custom text field view that handles both secure and regular text inputs with styling.
/// This view provides a text field that can either be a regular `TextField` or a `SecureField` depending on the `isSecure` flag.

struct CustomTextField: View {
    
    // MARK: - Properties
    var placeholder: String
    
    /// A binding to the text that the user inputs.
    @Binding var text: String
    
    /// A flag indicating whether the text field should be secure (password input).
        /// Default value is `false`.
    var isSecure: Bool = false
    
    /// The keyboard type for the text field. Default is `.default`.
    var keyboardType: UIKeyboardType = .default
    // MARK: - Body
    var body: some View {
        // TextField or SecureField based on isSecure flag
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .multilineTextAlignment(.leading)
                    .frame(height: 56)
                    .padding([.leading, .trailing],34)
                    .textStyle(size: 14, color: Color(UIColor.appSecondaryFontColor),
                               fontStyle: .interRegular)
                    .background(Color(UIColor.appLightGrayColor))
                    .keyboardType(keyboardType)
                    .cornerRadius(28)
                    .padding([.leading, .trailing],34)
            } else {
                TextField(placeholder, text: $text)
                    .multilineTextAlignment(.leading)
                    .frame(height: 56)
                    .padding([.leading, .trailing],34)
                    .textStyle(size: 14, color: Color(UIColor.appSecondaryFontColor),
                               fontStyle: .interRegular)
                    .background(Color(UIColor.appLightGrayColor))
                    .keyboardType(keyboardType)
                    .cornerRadius(28)
                    .multilineTextAlignment(.leading)
                    .onChange(of: text) { newValue in
                        // If the text is a mobile number, ensure it is only 10 characters long
                        if placeholder == AppStrings.mobile && newValue.count > 10 {
                            text = String(newValue.prefix(10)) // Trim to 10 characters
                        }
                    }
                    .padding([.leading, .trailing],34)
            }
        }
    }
}
