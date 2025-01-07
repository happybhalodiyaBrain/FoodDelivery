import SwiftUI

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
                        .appTitleStyle()
                    Text(AppStrings.otpNote)
                        .appSubtitleStyle()
                }
              
                
                // MARK: - OTP Input Fields Section
                HStack(spacing: 28) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("", text: $otpValue[index])
                            .frame(width: 60, height: 57)
                            .font(AppFont.FontStyle.interRegular.font(size: 24))
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .background(Color(UIColor.appLightGrayColor))
                            .cornerRadius(12)
                            .onChange(of: otpValue[index]) { newValue in
                                
                                // Limit input to one character
                                if newValue.count > 1 {
                                    otpValue[index] = String(newValue.prefix(1))
                                }
                            }
                    }
                }
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
