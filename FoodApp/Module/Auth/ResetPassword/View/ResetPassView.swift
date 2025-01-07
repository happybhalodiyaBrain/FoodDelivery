import SwiftUI

/// A view that provides the reset password screen, allowing the user to input their email and navigate to the OTP screen.
struct ResetPassView: View {
    
    // MARK: - Properties
    /// ViewModel to handle the state and logic of the reset password view.
    @StateObject private var viewModel = ResetPassViewModel()
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            // MARK: Title and Subtitle
            VStack(spacing: 13) {
                Text(AppStrings.resetPassword).appTitleStyle()
                Text(AppStrings.resetPassNote).appSubtitleStyle()
            }
            
            // MARK: Email Input Field
            CustomTextField(placeholder: AppStrings.email, text: $viewModel.email)
                .appTopPadding(40)
            
            // MARK: Send Button
            /// Navigation button to proceed to the OTP screen.
            CustomNavigationButton(
                title: AppStrings.send,
                backgroundColor: Color(UIColor.appOrangeColor),
                foregroundColor:Color(UIColor.appWhiteColor),
                action: { viewModel.onNavigateToOtpView()}
            ).appTopPadding(34)
            
            Spacer()
        }
        .padding(.vertical)
        .onTapGesture {
            // Dismiss keyboard when tapped outside input fields
            UIApplication.shared.endEditing()
        }
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
    ResetPassView()
}
