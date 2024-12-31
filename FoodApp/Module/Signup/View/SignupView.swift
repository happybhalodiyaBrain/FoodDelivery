import SwiftUI

/// The view for the Sign-Up screen, allowing users to enter their details.
struct SignupView: View {
    
    // MARK: - Properties
    
    /// The view model responsible for handling the sign-up logic.
    @StateObject private var viewModel = SignupViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                // Title and Subtitle
                Text(AppStrings.signUp).appTitleStyle()
                Text(AppStrings.loginDetails).appSubtitleStyle()

                Spacer()

                // Input fields
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.name, text: $viewModel.name)
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email)
                    CustomTextField(placeholder: AppStrings.mobile, text: $viewModel.mobile)
                    CustomTextField(placeholder: AppStrings.address, text: $viewModel.address)
                    CustomTextField(placeholder: AppStrings.password, text: $viewModel.password)
                    CustomTextField(placeholder: AppStrings.confirmPassword, text: $viewModel.confirmPassword)
                }
                .padding(.horizontal, 30)
                .padding(.top, 35)

                // Error message display
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 10)
                }

                Spacer()

                // Sign Up Button
                VStack(spacing: 30) {
                    CustomButton(title: AppStrings.signUp, backgroundColor: Color(UIColor.appOrangeColor)) {
                        // Validate inputs
                        viewModel.validateInputs {
                            // If validation is successful, proceed with sign-up
                            print("Sign up successful!")
                            // Add additional sign-up logic here (e.g., API call)
                        }
                    }
                }
                .appHorizontalPadding(30)

                Spacer()

                // Login Link
                HStack {
                    Text(AppStrings.loginLink)
                        .font(.system(size: 14))
                        .foregroundColor(Color(UIColor.appSecondaryFontColor))

                    Button(action: {
                        // Navigate to Login screen
                    }) {
                        NavigationLink(destination: LoginView()) {
                            Text(AppStrings.login)
                                .font(.system(size: 14))
                                .foregroundColor(Color(UIColor.appOrangeColor))
                        }
                    }
                }
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
    SignupView()
}
