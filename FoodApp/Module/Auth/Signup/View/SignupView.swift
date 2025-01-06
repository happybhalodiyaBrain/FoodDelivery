import SwiftUI

/// The view for the Sign-Up screen, allowing users to enter their details.
struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 13) {
                // MARK: - Title and Subtitle
                Text(AppStrings.signUp).appTitleStyle()
                Text(AppStrings.signupSubtitle).appSubtitleStyle()
                
                // MARK: - Input Fields
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.name, text: $viewModel.name)
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email, keyboardType: .emailAddress)
                    CustomTextField(placeholder: AppStrings.mobile, text: $viewModel.mobile,keyboardType: .numberPad)
                    CustomTextField(placeholder: AppStrings.address, text: $viewModel.address)
                    CustomTextField(placeholder: AppStrings.password, text: $viewModel.password, isSecure: true)
                    CustomTextField(placeholder: AppStrings.confirmPassword, text: $viewModel.confirmPassword, isSecure: true)
                }
                .padding(.top, 35)
                
                //MARK: - Sign up Button
                CustomNavigationButton(
                    title: AppStrings.signUp,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor:Color(UIColor.appWhiteColor),
                    action: { viewModel.validateInputs {
                        // Handle successful login logic here
                        print("Sign up successful!")
                    }}
                ).appTopPadding(28)
            
                // MARK: - Login Link
                DidntReceiveLinkView(
                    message: AppStrings.loginLink,
                    linkText: AppStrings.clickHere,
                    action: { viewModel.onNavigateToLogin() }
                ).appTopPadding(25)
            }
            .navigationBarBackButtonHidden(true)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        .showAlert(
            isPresented: $viewModel.showAlert,
            title: AppStrings.ErrorMessages.validationError,
            message: viewModel.alertMessage
        )
    }
}


#Preview {
    SignupView()
}
