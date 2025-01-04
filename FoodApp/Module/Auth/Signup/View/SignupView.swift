import SwiftUI

/// The view for the Sign-Up screen, allowing users to enter their details.
struct SignupView: View {
    
    // MARK: - Properties
    
    /// The view model responsible for handling the sign-up logic.
    @StateObject private var viewModel = SignupViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(spacing: 13) {
                
                // Title and Subtitle
                Text(AppStrings.signUp).appTitleStyle()
                Text(AppStrings.signupSubtitle).appSubtitleStyle()
                
                // Input fields
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.name, text: $viewModel.name)
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email)
                    CustomTextField(placeholder: AppStrings.mobile, text: $viewModel.mobile)
                    CustomTextField(placeholder: AppStrings.address, text: $viewModel.address)
                    CustomTextField(placeholder: AppStrings.password, text: $viewModel.password)
                    CustomTextField(placeholder: AppStrings.confirmPassword, text: $viewModel.confirmPassword)
                }
                .padding(.top, 35)
                
                // Error message display
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .padding(.top, 10)
                }
                
                
                
                // Sign Up Button
                CustomButton(title: AppStrings.signUp, backgroundColor: Color(UIColor.appOrangeColor)) {
                    // Validate inputs
                    viewModel.validateInputs {
                        // If validation is successful, proceed with sign-up
                        print("Sign up successful!")
                        // Add additional sign-up logic here (e.g., API call)
                    }
                }
                
                .appHorizontalPadding(30)
                .appTopPadding(28)
                
                
                // Login Link
                DidntReceiveLinkView(
                    message: AppStrings.loginLink,
                    linkText: AppStrings.clickHere,
                    action: { viewModel.onNavigateToLogin()}
                ).appTopPadding(25)
                
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
