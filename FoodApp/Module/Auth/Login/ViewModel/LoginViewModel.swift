import Foundation
import SwiftUI

/// ViewModel for handling login logic and navigation in the LoginView.
class LoginViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    // MARK: - Methods
    
    /// Validates the login credentials and triggers the completion handler if valid.
    /// - Parameter completion: A closure that is called when the credentials are valid.
    func validateLogin(completion: @escaping () -> Void) {
        if !ValidationUtils.isValidEmail(email) {
            alertMessage = AppStrings.ErrorMessages.emailError
            showAlert = true
        } else if !ValidationUtils.isValidPassword(password) {
            alertMessage = AppStrings.ErrorMessages.passwordError
            showAlert = true
        } else {
            showAlert = false
            completion()
        }
    }
    
    /// Navigates to the sign-up page.
    func onNavigateToSignupPage () {
        NavigationService.shared.push(to: .auth(.signup))
    }
    
    /// Navigates to the reset password page.
    func onNavigateToResetPasswordView () {
        NavigationService.shared.push(to: .auth(.resetPassword))
    }
}
