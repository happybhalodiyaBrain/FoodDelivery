import SwiftUI

struct LoginView: View {
    // MARK: - ViewModel
    /// ViewModel for handling navigation logic.
    @StateObject private var viewModel = LoginViewModel()
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                // MARK: - Title and Subtitle
                VStack(spacing: 14) {
                    Text(AppStrings.login).appTitleStyle()
                    Text(AppStrings.loginDetails).appSubtitleStyle()
                }
                // MARK: - Input Fields
                // Input fields for email and password
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email, keyboardType: .emailAddress)
                    CustomTextField(placeholder: AppStrings.password, text: $viewModel.password, isSecure: true)
                }
                .appTopPadding(35)
                
                // MARK: - Login Button
                CustomNavigationButton(
                    title: AppStrings.login,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor:Color(UIColor.appWhiteColor),
                    action: { viewModel.validateLogin {
                        // Handle successful login logic here
                        print("Login successful!")
                        NavigationService.shared.updateLoginStatus(true)
                    }}
                )
                
                // MARK: - Forgot Password Button
                Text(AppStrings.forgotPassword)
                    .textStyle(size: 14, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                    .appTopPadding(25)
                    .onTapGesture {
                        viewModel.onNavigateToResetPasswordView()
                    }
                
                // MARK: - Social Media Login Options
                VStack {
                    Text(AppStrings.loginWith)
                        .textStyle(size: 14, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                        .appTopPadding(51)
                    
                    VStack(spacing: 28) {
                        /// Facebook login button
                        SocialMediaButton(
                            title: AppStrings.loginwithFacebook,
                            image: AppImages.facebook.rawValue,
                            backgroundColor: Color(UIColor.appFacebookColor)
                        ) {
                            print("Login with Facebook tapped")
                        }
                        /// Google  login button 
                        SocialMediaButton(
                            title: AppStrings.loginwithgoogle,
                            image: AppImages.google.rawValue,
                            backgroundColor: Color(UIColor.appGoogleColor)
                        ) {
                            print("Login with Google tapped")
                        }
                    }
                    .appHorizontalPadding(30)
                    .appTopPadding(25)
                }
                
                // MARK: - Sign Up Link
                DidntReceiveLinkView(
                    message: AppStrings.signupLink,
                    linkText: AppStrings.clickHere,
                    action: { viewModel.onNavigateToSignupPage() }
                )
            }
            .padding(.vertical)
            .navigationBarBackButtonHidden(true)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        .showAlert(
            isPresented: $viewModel.showAlert,
            title:AppStrings.ErrorMessages.validationError,
            message: viewModel.alertMessage
        )
    }
}
#Preview {
    LoginView()
}
