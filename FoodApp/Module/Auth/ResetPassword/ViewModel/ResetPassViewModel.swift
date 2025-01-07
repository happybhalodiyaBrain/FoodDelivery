import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class ResetPassViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// The email entered by the user.
    @Published var email: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    /// Validates the email and navigates to the OTP view if valid.
    func onNavigateToOtpView() {
        if !ValidationUtils.isValidEmail(email) {
            alertMessage = AppStrings.ErrorMessages.emailError
            showAlert = true
        } else {
            showAlert = false
            NavigationService.shared.push(to: .auth(.verifyOTP))
        }
    }
}
