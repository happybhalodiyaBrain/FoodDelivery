import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""

    /// Validates the login credentials and triggers the completion if valid.
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
    func NavigateToSignupPage () {
        NavigationService.shared.push(to: .auth(.signup))
    }
}
