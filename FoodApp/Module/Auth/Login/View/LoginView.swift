import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                // MARK: - Title and Subtitle
                VStack(spacing: 14) {
                    Text(AppStrings.login).appTitleStyle()
                    Text(AppStrings.loginDetails).appSubtitleStyle()
                }
                
                // Input fields for email and password
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email, keyboardType: .emailAddress)
                    CustomTextField(placeholder: AppStrings.password, text: $viewModel.password, isSecure: true)
                }
                .appTopPadding(35)
                
                // MARK: - Login Button
                CustomButton(title: AppStrings.login, backgroundColor: Color(UIColor.appOrangeColor)) {
                    viewModel.validateLogin {
                        // Handle successful login logic here
                        print("Login successful!")
                    }
                }
                .appHorizontalPadding(34)
                
                // MARK: - Forgot Password Button
                Button(action: {
                    print("Forgot password tapped")
                }) {
                    NavigationLink(destination: ResetPassView()) {
                        Text(AppStrings.forgotPassword)
                            .font(AppFont.FontStyle.interRegular.font(size: 14))
                            .foregroundColor(Color(UIColor.appSecondaryFontColor))
                    }
                }
                .appTopPadding(25)
                
                // MARK: - Social Media Login Options
                VStack {
                    Text(AppStrings.loginWith)
                        .font(AppFont.FontStyle.interRegular.font(size: 14))
                        .foregroundColor(Color(UIColor.appSecondaryFontColor))
                        .appTopPadding(51)
                    
                    VStack(spacing: 28) {
                        SocialMediaButton(
                            title: AppStrings.loginwithFacebook,
                            image: AppImages.facebook.rawValue,
                            backgroundColor: Color(UIColor.appFacebookColor)
                        ) {
                            print("Login with Facebook tapped")
                        }
                        
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
                    action: { viewModel.NavigateToSignupPage() }
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
            title: "Validation Error",
            message: viewModel.alertMessage
        )
    }
}
