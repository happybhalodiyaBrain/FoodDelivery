import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var address: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
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
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
    
    func onNavigateToLogin() {
        NavigationService.shared.pop()
    }
}
