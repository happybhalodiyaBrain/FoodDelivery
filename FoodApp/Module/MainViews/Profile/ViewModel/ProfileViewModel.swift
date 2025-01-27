import Foundation

// MARK: - ProfileViewModel Class
class ProfileViewModel: ObservableObject {
    
    // MARK: - Published Properties for User Input
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var address: String = ""
    @Published var pincode: String = ""
    @Published var city: String = ""
    
    // MARK: - Published Properties for Alert
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertTitle: String = ""
    @Published var isSignOutAlert: Bool = false
    
    /// Validates the user inputs and triggers completion if valid.
    /// - Parameter completion: The closure to be executed upon successful validation.
    func validateInputs(completion: @escaping () -> Void) {
        if ValidationUtils.isEmpty(name) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.nameError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(email){
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.emptyEmailError, alertType: .emptyError)
        } else if !ValidationUtils.isValidEmail(email) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.emailError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(mobile) || mobile.count < 10 {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.mobileError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(address) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.addressError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(city) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.cityError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(pincode) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.pincodeError, alertType: .emptyError)
        } else {
            completion()
        }
    }
    
    // MARK: - Show Alert
    /// Displays an alert with the provided title, message, and alert type.
    /// - Parameters:
    ///   - title: The title to be displayed in the alert.
    ///   - message: The message to be displayed in the alert.
    ///   - alertType: The type of alert, which can be used to customize the behavior (default is `.emptyError`).
    private func showAlert(title: String, message: String, alertType: AlertType = .emptyError) {
        alertTitle = title
        alertMessage = message
        showAlert = true
        self.isSignOutAlert = alertType == .signOut
    }
    // MARK: - Sign Out Alert
    /// Triggers the sign-out confirmation alert.
    func showSignOutAlert() {
        isSignOutAlert = true
        showAlert(title: AppStrings.signOut, message: AppStrings.signoutMessage, alertType: .signOut)
    }
    
    
    // MARK: - Sign Out Logic
    /// Signs the user out by clearing the stored login state and navigating to the login screen.
    func signOut() {
        UserDefaults.standard.removeObject(forKey: AppStrings.loginKey)
        NavigationService.shared.popToRoot(push: .auth(.login))
    }
    
}
