import Foundation
class NewPassordViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// The new password entered by the user.
    @Published var newPassowrd: String = ""
    
    /// The confirm password entered by the user.
    @Published var confirmPassowrd: String = ""
    
    /// Flag to show an alert.
      @Published var showAlert: Bool = false
      
      /// Message to display in the alert.
      @Published var alertMessage: String = ""
    
    /// Validates the new password and confirm password fields.
       func validatePasswords(completion: @escaping () -> Void) {
           if newPassowrd.isEmpty || !ValidationUtils.isValidPassword(newPassowrd) {
               alertMessage = AppStrings.ErrorMessages.passwordError
               showAlert = true
           } else if newPassowrd != confirmPassowrd {
               alertMessage = AppStrings.ErrorMessages.confirmPasswordError
               showAlert = true
           } else {
               showAlert = false
               completion()
           }
       }
       
       /// Navigates to the login screen after setting the new password.
       func onNavigateToNewPasswordView() {
           validatePasswords {
               // Perform navigation only if validation succeeds
               NavigationService.shared.popToRoot(push: .auth(.login))
           }
       }
}

