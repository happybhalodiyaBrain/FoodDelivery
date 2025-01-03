import SwiftUI

/// A view that provides the reset password screen, allowing the user to input their email and navigate to the OTP screen.
struct ResetPassView: View {
    
    // MARK: - Properties
    /// ViewModel to handle the state and logic of the reset password view.
    @StateObject private var viewModel = ResetPassViewModel()
    
    // MARK: - Body
    var body: some View {
  
            VStack(spacing: 35) {
                
                // MARK: Title and Subtitle
                VStack(spacing: 10) {
                    Text(AppStrings.resetPassword).appTitleStyle()
                    Text(AppStrings.resetPassNote).appSubtitleStyle()
                }
                .appHorizontalPadding(50)
                
                // MARK: Email Input Field
                VStack(spacing: 40) {
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email)
                }
                .appHorizontalPadding(34)
                .appTopPadding(40)
                
                // MARK: Send Button
                /// Navigation button to proceed to the OTP screen.
                CustomNavigationButton(
                    title: AppStrings.send,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor:Color(UIColor.appWhiteColor),
                    action: { viewModel.NavigateToOtpView()}
                )
                Spacer()
            }
            .padding(.top, 30)
            .onTapGesture {
                // Dismiss keyboard when tapped outside input fields
                UIApplication.shared.endEditing()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
       
    }
    


// MARK: - Preview
#Preview {
    ResetPassView()
}
