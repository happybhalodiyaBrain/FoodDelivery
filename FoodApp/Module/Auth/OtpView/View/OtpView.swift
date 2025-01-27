import SwiftUI
import Foundation

struct OtpView: View {
    
    // MARK: - Properties
    /// A state variable that holds the OTP input values.
    @State private var otpValue: [String] = ["", "", "", ""]
    @StateObject private var viewModel = OTPViewModel()

    // MARK: - Body
    var body: some View {
    
            VStack {
                // MARK: - Title and Subtitle Section
                VStack(spacing: 13) {
                    Text(AppStrings.otpTitle)
                        .textStyle(size: 25, color: Color(UIColor.appDarkGeryColor), fontStyle: .interRegular)
                        .padding(.horizontal, 36)
                    Text(AppStrings.otpNote)
                        .appSubtitleStyle()
                }
              
                
                // MARK: - OTP Input Fields Section
                OtpInputView(otpValue: $otpValue)
                    .appTopPadding(53)
                
                
                // MARK: - Next Button Section
                CustomNavigationButton(
                    title: AppStrings.next,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor:Color(UIColor.appWhiteColor),
                    action: {viewModel.onNavigateToNewPasswordView()}
                ).appTopPadding(36)
                
                // MARK: - "Didn't Receive OTP?" Link Section
                DidntReceiveLinkView(
                    message: AppStrings.DidntReceive,
                    linkText: AppStrings.clickHere,
                    action:{
                        viewModel.onNavigateToResetPasswordView()
                    }
                ).appTopPadding(33)
                
                // MARK: - Spacer Section
                Spacer()
            }
            .padding(.vertical)
            .onTapGesture {
                // Dismiss keyboard when tapped outside input fields
                UIApplication.shared.endEditing()
            }
            .navigationBarBackButtonHidden()
            .navigationBarHidden(true)
        }
        
    }


// MARK: - Preview
#Preview {
    OtpView()
}
