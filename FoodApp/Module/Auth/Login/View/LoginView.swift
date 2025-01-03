import SwiftUI

/// View for the Login screen, allowing users to log in using their email and password, or social media accounts.
struct LoginView: View {
    
    // MARK: - Properties
    
    /// ViewModel responsible for handling the login logic and validation.
    @StateObject private var viewModel = LoginViewModel()
    
    // MARK: - Body
    
    var body: some View {
      
            ScrollView {
                VStack(spacing: 35) {
                    Spacer()
                    
                    //MARK: - Title and Subtitle
                    VStack(spacing: 10) {
                        Text(AppStrings.login).appTitleStyle()
                        Text(AppStrings.loginDetails).appSubtitleStyle()
                    }
                    
                    // Input fields for email and password
                    VStack(spacing: 28) {
                        CustomTextField(placeholder: AppStrings.email, text: $viewModel.email)
                        CustomTextField(placeholder: AppStrings.password, text: $viewModel.password, isSecure: true)
                    }
                    .appHorizontalPadding(34)
                    
                    //MARK: - Error message display
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 10)
                    }
                    
                    //MARK: - Login Button
                    CustomButton(title: AppStrings.login, backgroundColor: Color(UIColor.appOrangeColor)) {
                        viewModel.validateLogin {
                            // Handle successful login logic here
                            print("Login successful!")
                            // Navigate to the main screen or trigger other actions
                        }
                    }
                    .appHorizontalPadding(34)
                    
                    //MARK: - Forgot Password Button
                    Button(action: {
                        // Handle forgot password logic
                        print("Forgot password tapped")
                    }) {
                        NavigationLink(destination: ResetPassView()) {
                            Text(AppStrings.forgotPassword)
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(Color(UIColor.appSecondaryFontColor))
                        }
                    }
                    .appTopPadding(10)
                    
                    //MARK: - Social Media Login Options
                    VStack {
                        Text(AppStrings.loginWith)
                            .font(.footnote)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .appTopPadding(30)
                        
                        VStack(spacing: 28) {
                            SocialMediaButton(
                                title: AppStrings.loginwithFacebook,
                                image: AppImages.facebook.rawValue,
                                backgroundColor: Color(UIColor.appFacebookColor)
                            ) {
                                // Handle Facebook login
                                print("Login with Facebook tapped")
                            }
                            
                            SocialMediaButton(
                                title: AppStrings.loginwithgoogle,
                                image: AppImages.google.rawValue,
                                backgroundColor: Color(UIColor.appGoogleColor)
                            ) {
                                // Handle Google login
                                print("Login with Google tapped")
                            }
                        }
                        .appHorizontalPadding(30)
                        .appTopPadding(25)
                    }
                    
                    //MARK: - Sign Up Link
                    DidntReceiveLinkView(
                        message: AppStrings.signupLink,
                        linkText: AppStrings.clickHere,
                        action: {viewModel.NavigateToSignupPage() }                    
                    )
                    Spacer()
                }
                .padding(.vertical)
                .navigationBarBackButtonHidden(true)
                .onTapGesture {
                    // Dismiss keyboard when tapped outside input fields
                    UIApplication.shared.endEditing()
                }
            }
        
    }
}

#Preview {
    LoginView()
}
