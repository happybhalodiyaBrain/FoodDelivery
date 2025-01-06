import SwiftUI

// MARK: - AuthRoutes
extension Routes.AuthRoutes {
    /// Returns the appropriate view based on the authentication route.
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .loginMain:
            // Returns the LoginMainView for the main login screen
            LoginMainView()
        case .login:
            // Returns the LoginView for the login screen
            LoginView()
        case .signup:
            // Returns the SignupView for the signup screen
            SignupView()
        case .resetPassword:
            // Returns the ResetPassView for the password reset screen
            ResetPassView()
        case .verifyOTP:
            // Returns the OtpView for OTP verification screen
            OtpView()
        case .newPassword:
            // Returns the NewPasswordView for setting a new password screen
            NewPasswordView()
        }
    }
}

