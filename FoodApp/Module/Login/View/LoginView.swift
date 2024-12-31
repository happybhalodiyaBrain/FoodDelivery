import SwiftUI

/// View for the Login screen, allowing users to log in using their email and password, or social media accounts.
struct LoginView: View {
    
    // MARK: - Properties
    
    /// ViewModel responsible for handling the login logic and validation.
    @StateObject private var viewModel = LoginViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 35) {
                    Spacer()
                    
                    // Title and Subtitle
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

                    // Error message display
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 10)
                    }

                    // Login Button
                    CustomButton(title: AppStrings.login, backgroundColor: Color(UIColor.appOrangeColor)) {
                        viewModel.validateLogin {
                            // Handle successful login logic here
                            print("Login successful!")
                            // Navigate to the main screen or trigger other actions
                        }
                    }
                    .appHorizontalPadding(34)

                    // Forgot Password Button
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

                    // Social Media Login Options
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

                    // Sign Up Link
                    HStack {
                        Text(AppStrings.signupLink)
                            .font(.footnote)
                            .foregroundColor(.gray)

                        Button(action: {
                            // Handle sign-up navigation action
                        }) {
                            NavigationLink(destination: SignupView()) {
                                Text(AppStrings.signUp)
                                    .font(.footnote)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .padding(.bottom, 26)
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
}

#Preview {
    LoginView()
}
