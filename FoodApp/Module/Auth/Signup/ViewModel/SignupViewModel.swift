import SwiftUI

class SignupViewModel: ObservableObject {
    
    // MARK: - Published Properties for User Input
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var address: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    // MARK: - Published Properties for Alert
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    /// Validates the user inputs and triggers completion if valid.
    /// - Parameter completion: The closure to be executed upon successful validation.
    func validateInputs(completion: @escaping () -> Void) {
        if ValidationUtils.isEmpty(name) {
            showAlert(message: AppStrings.ErrorMessages.nameError)
        } else if !ValidationUtils.isValidEmail(email) {
            showAlert(message: AppStrings.ErrorMessages.emailError)
        } else if ValidationUtils.isEmpty(mobile) || mobile.count < 10 {
            showAlert(message: AppStrings.ErrorMessages.mobileError)
        } else if ValidationUtils.isEmpty(address) {
            showAlert(message: AppStrings.ErrorMessages.addressError)
        } else if !ValidationUtils.isValidPassword(password) {
            showAlert(message: AppStrings.ErrorMessages.passwordError)
        } else if !ValidationUtils.passwordsMatch(password, confirmPassword) {
            showAlert(message: AppStrings.ErrorMessages.confirmPasswordError)
        } else {
            completion()
        }
    }
    /// Displays an alert with the given message.
    /// - Parameter message: The message to be shown in the alert.
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
    
    /// Navigates to the login view by popping the current view from the navigation stack.
    func onNavigateToLogin() {
        NavigationService.shared.pop()
    }
}
