import SwiftUI

struct NewPasswordView: View {
    
    // MARK: - ViewModel
    /// ViewModel for handling navigation logic.
    @StateObject private var viewModel = NewPassordViewModel()
    
    // MARK: - Body
    var body: some View {
        
        // MARK: - Title and Subtitle Section
        VStack {
            VStack(spacing: 14) {
                Text(AppStrings.newPassword).appTitleStyle()
                Text(AppStrings.newPasswordNote).appSubtitleStyle()
            }
            
            // MARK: - Input Fields Section
            VStack(spacing: 28) {
                CustomTextField(placeholder: AppStrings.newPassword, text: $viewModel.newPassowrd, isSecure: true)
                CustomTextField(placeholder: AppStrings.confiemPassword, text: $viewModel.confirmPassowrd, isSecure: true)
            }
            .appTopPadding(38)
            .onTapGesture {
                // Dismiss keyboard when tapped outside input fields
                UIApplication.shared.endEditing()
            }
            
            // MARK: - Next Button Section
            CustomNavigationButton(
                title: AppStrings.next,
                backgroundColor: Color(UIColor.appOrangeColor),
                foregroundColor:Color(UIColor.appWhiteColor),
                action: { viewModel.onNavigateToNewPasswordView()}
            ).appTopPadding(28)
            
            // MARK: - Spacer Section
            Spacer()
        }
        .padding(.vertical)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
        .showAlert(
            isPresented: $viewModel.showAlert,
            title: AppStrings.ErrorMessages.validationError,
            message: viewModel.alertMessage
        )
    }
}


// MARK: - Preview
#Preview {
    NewPasswordView()
}
