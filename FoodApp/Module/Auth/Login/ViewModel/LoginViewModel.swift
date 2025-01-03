import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class LoginViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// The email entered by the user.
    @Published var email: String = ""
    
    /// The password entered by the user.
    @Published var password: String = ""
    
    /// The error message to be displayed when validation fails.
    @Published var errorMessage: String? = nil
    
    // MARK: - Validation Methods
    
    /// Validates the login credentials (email and password).
    ///
    /// - Parameter completion: A closure that is executed when both the email and password are valid.
    func validateLogin(completion: @escaping () -> Void) {
        // Check if the email is valid
        if !isValidEmail(email) {
            errorMessage = "Enter Your Email Address"
        // Check if the password is at least 6 characters
        } else if password.isEmpty || password.count < 6 {
            errorMessage = "Password should be at least 6 characters"
        } else {
            // If no errors, clear the error message and execute the completion closure
            errorMessage = nil
            completion()
        }
    }
    
    // MARK: - Private Helper Methods
    
    /// Validates if the provided email matches a simple regular expression for email format.
    ///
    /// - Parameter email: The email string to be validated.
    /// - Returns: A boolean indicating whether the email is valid.
    private func isValidEmail(_ email: String) -> Bool {
        // Basic email validation using regex
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
    
    func NavigateToSignupPage () {
        NavigationService.shared.push(to: .auth(.signup))
    }
    
}
