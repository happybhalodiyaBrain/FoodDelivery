import SwiftUI

/// ViewModel that handles the sign-up form validation logic.
class SignupViewModel: ObservableObject {
    // MARK: - Published Properties
    
    /// The name entered by the user.
    @Published var name: String = ""
    
    /// The email entered by the user.
    @Published var email: String = ""
    
    /// The mobile number entered by the user.
    @Published var mobile: String = ""
    
    /// The address entered by the user.
    @Published var address: String = ""
    
    /// The password entered by the user.
    @Published var password: String = ""
    
    /// The confirmation password entered by the user.
    @Published var confirmPassword: String = ""
    
    /// The error message to be displayed when validation fails.
    @Published var errorMessage: String? = nil
    
    // MARK: - Validation Methods
    
    /// Validates the inputs of the sign-up form. If any input is invalid, sets the error message.
    ///
    /// - Parameter completion: A closure that is executed when all inputs are valid.
    func validateInputs(completion: @escaping () -> Void) {
        // Check if the name is empty
        if name.isEmpty {
            errorMessage = "Name cannot be empty"
        // Check if the email is valid
        } else if !isValidEmail(email) {
            errorMessage = "Please enter a valid email"
        // Check if the mobile number is valid
        } else if mobile.isEmpty || mobile.count < 10 {
            errorMessage = "Please enter a valid mobile number"
        // Check if the address is empty
        } else if address.isEmpty {
            errorMessage = "Address cannot be empty"
        // Check if the password is at least 6 characters
        } else if password.isEmpty || password.count < 6 {
            errorMessage = "Password should be at least 6 characters"
        // Check if the passwords match
        } else if password != confirmPassword {
            errorMessage = "Passwords do not match"
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
}
