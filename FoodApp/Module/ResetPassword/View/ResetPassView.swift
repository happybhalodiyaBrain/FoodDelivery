import SwiftUI

struct ResetPassView: View {
    @StateObject private var viewModel = ResetPassViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 35) {
                // Title and Subtitle
                VStack(spacing: 10) {
                    Text(AppStrings.resetPassword).appTitleStyle()
                    Text(AppStrings.resetPassNote).appSubtitleStyle()
                }
                .appHorizontalPadding(50)
                
                VStack(spacing: 50) {
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email)
                }
                .appHorizontalPadding(34)
                .appTopPadding(40)
                
                // Send Button
                NavigationLink(destination: OtpView()) {
                    Text(AppStrings.send)
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .foregroundColor(Color(UIColor.appWhiteColor))
                        .background(Color(UIColor.appOrangeColor))
                        .cornerRadius(28)
                }
                .appHorizontalPadding(34)
                Spacer()
            }
           
            .padding(.top, 30)
          
            .onTapGesture {
                // Dismiss keyboard when tapped outside input fields
                UIApplication.shared.endEditing()
                
               
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }

}

#Preview {
    ResetPassView()
}
