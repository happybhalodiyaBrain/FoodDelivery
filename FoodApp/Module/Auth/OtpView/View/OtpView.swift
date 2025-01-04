import SwiftUI

struct OtpView: View {
    
    // MARK: - Properties
    /// A state variable that holds the OTP input values.
    @State private var otp: [String] = Array(repeating: "", count: 4)
    @StateObject private var viewModel = OTPViewModel()

    // MARK: - Body
    var body: some View {
    
            VStack {
                
                // MARK: - Title and Subtitle Section
                VStack(spacing: 13) {
                    Text(AppStrings.otpTitle)
                        .appTitleStyle()
                    Text(AppStrings.otpNote)
                        .appSubtitleStyle()
                }
              
                
                // MARK: - OTP Input Fields Section
                HStack(spacing: 28) {
                    ForEach(0..<otp.count, id: \.self) { index in
                        TextField("*", text: Binding(
                            get: { otp[index] },
                            set: { newValue in
                                // Ensure that only one character is entered per field
                                otp[index] = String(newValue.prefix(1))
                            }
                        ))
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 56, height: 56)
                        .background(Color(UIColor.appLightGrayColor))
                        .cornerRadius(8)
                    }
                }
                .appTopPadding(53)
                
                // MARK: - Next Button Section
                CustomNavigationButton(
                    title: AppStrings.next,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor:Color(UIColor.appWhiteColor),
                    action: {viewModel.NavigateToNewPasswordView()}
                ).appTopPadding(36)
                
                // MARK: - "Didn't Receive OTP?" Link Section
                DidntReceiveLinkView(
                    message: AppStrings.DidntReceive,
                    linkText: AppStrings.clickHere,
                    action:{
                        viewModel.NavigateToResetPasswordView()
                    }
                ).appTopPadding(33)
                
                // MARK: - Spacer Section
                Spacer()
            }
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
