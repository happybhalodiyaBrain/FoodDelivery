import Foundation

/// Utility class for common validation functions.
class ValidationUtils {
    
    /// Validates if the provided email matches a basic email format.
    ///
    /// - Parameter email: The email string to be validated.
    /// - Returns: A boolean indicating whether the email is valid.
    static func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
    
    /// Validates if a string is empty.
    ///
    /// - Parameter text: The text to be validated.
    /// - Returns: A boolean indicating whether the text is empty.
    static func isEmpty(_ text: String) -> Bool {
        return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    /// Validates if a password meets the minimum length requirement.
    ///
    /// - Parameter password: The password string to be validated.
    /// - Returns: A boolean indicating whether the password is valid.
    static func isValidPassword(_ password: String, minLength: Int = 6) -> Bool {
        return password.count >= minLength
    }
    
    /// Validates if two passwords match.
    ///
    /// - Parameters:
    ///   - password: The first password.
    ///   - confirmPassword: The second password to confirm.
    /// - Returns: A boolean indicating whether the passwords match.
    static func passwordsMatch(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
