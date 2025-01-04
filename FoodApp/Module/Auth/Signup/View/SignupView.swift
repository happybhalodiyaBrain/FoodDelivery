import SwiftUI

/// The view for the Sign-Up screen, allowing users to enter their details.
struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()
    
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
                    CustomTextField(placeholder: AppStrings.password, text: $viewModel.password, isSecure: true)
                    CustomTextField(placeholder: AppStrings.confirmPassword, text: $viewModel.confirmPassword, isSecure: true)
                }
                .padding(.top, 35)
                
                // Sign Up Button
                CustomButton(title: AppStrings.signUp, backgroundColor: Color(UIColor.appOrangeColor)) {
                    viewModel.validateInputs {
                        print("Sign up successful!")
                        // Add additional sign-up logic here
                    }
                }
                .appHorizontalPadding(30)
                .appTopPadding(28)
                
                // Login Link
                DidntReceiveLinkView(
                    message: AppStrings.loginLink,
                    linkText: AppStrings.clickHere,
                    action: { viewModel.onNavigateToLogin() }
                ).appTopPadding(25)
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


#Preview {
    SignupView()
}
