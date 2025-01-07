import SwiftUI


/// AuthRouteBuilder
struct AuthRouteBuilder {
    
    // MARK: - Variable(s)
    let routes: Routes.AuthRoutes
    
    // MARK: - ViewBuilder
    @ViewBuilder
    func configure() -> some View {
        switch routes {
        case.loginMain:
            LoginMainView()
        case .login:
            LoginView()
        case .signup:
            SignupView()
        case .resetPassword:
            ResetPassView()
        case .otpView:
            OtpView()
        case .newPassword:
            NewPasswordView()
        }
    }
}
