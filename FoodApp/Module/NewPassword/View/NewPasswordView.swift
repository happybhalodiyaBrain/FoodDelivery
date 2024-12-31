import SwiftUI

struct NewPasswordView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = NewPassordViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack{
            // MARK: - Title and Subtitle Section
            VStack(spacing: 35) {
                VStack(spacing: 10) {
                    Text(AppStrings.newPassword).appTitleStyle()
                    Text(AppStrings.newPasswordNote).appSubtitleStyle()
                }
                .appHorizontalPadding(50)
                
                // MARK: - Input Fields Section
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.newPassword, text: $viewModel.newPassowrd)
                    CustomTextField(placeholder: AppStrings.confiemPassword, text: $viewModel.confirmPassowrd)
                }
                .appHorizontalPadding(34)
                .onTapGesture {
                    // Dismiss keyboard when tapped outside input fields
                    UIApplication.shared.endEditing()
                }
                
                // MARK: - Next Button Section
                CustomNavigationButton(
                    title: AppStrings.next,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    destination: NewPasswordView()
                )
                // MARK: - Spacer Section
                Spacer()
                
                
            }
            .padding(.vertical)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}

// MARK: - Preview
#Preview {
    NewPasswordView()
}
