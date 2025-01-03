import SwiftUI

// MARK: - AuthRoutes
extension Routes.AuthRoutes {
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .loginMain:
            LoginMainView()
        case .login:
            LoginView()
        case .signup:
            SignupView()
        case .resetPassword:
            ResetPassView()
        case .verifyOTP:
            OtpView()
        case .newPassword:
            NewPasswordView()
        }
    }
}

