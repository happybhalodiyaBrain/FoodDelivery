import SwiftUI

struct NewPasswordView: View {
    
    /// ViewModel responsible for handling the login logic and validation.
    @StateObject private var viewModel = NewPassordViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 35) {
                VStack(spacing: 10) {
                    Text(AppStrings.newPassword).appTitleStyle()
                    Text(AppStrings.newPasswordNote).appSubtitleStyle()
                }
                .appHorizontalPadding(50)
                
                // Input fields for email and password
                VStack(spacing: 28) {
                    CustomTextField(placeholder: AppStrings.newPassword, text: $viewModel.newPassowrd)
                    CustomTextField(placeholder: AppStrings.confiemPassword, text: $viewModel.confirmPassowrd)
                }
                .appHorizontalPadding(34)
                
                NavigationLink(destination: NewPasswordView()) {
                    Text(AppStrings.next)
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .foregroundColor(Color(UIColor.appWhiteColor))
                        .background(Color(UIColor.appOrangeColor))
                        .cornerRadius(28)
                }
                .appHorizontalPadding(34)

                Spacer()
              
            }
            .padding(.vertical)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NewPasswordView()
}
