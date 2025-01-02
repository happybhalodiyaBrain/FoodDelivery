import SwiftUI

struct OtpView: View {
    
    // MARK: - Properties
    /// A state variable that holds the OTP input values.
    @State private var otp: [String] = Array(repeating: "", count: 4)
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 35) {
                
                // MARK: - Title and Subtitle Section
                VStack(spacing: 10) {
                    Text(AppStrings.otpTitle)
                        .appTitleStyle()
                    Text(AppStrings.otpNote)
                        .appSubtitleStyle()
                }
                .appHorizontalPadding(50)
                
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
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }
                .padding(.top, 34)
                
                // MARK: - Next Button Section
                CustomNavigationButton(
                    title: AppStrings.next,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    destination: NewPasswordView(),
                    foregroundColor:Color(UIColor.appWhiteColor)
                )
                
                // MARK: - "Didn't Receive OTP?" Link Section
                DidntReceiveLinkView(
                    message: AppStrings.DidntReceive,
                    linkText: AppStrings.clickHere,
                    destination: ResetPassView()
                )
                
                // MARK: - Spacer Section
                Spacer()
            }
            .onTapGesture {
                // Dismiss keyboard when tapped outside input fields
                UIApplication.shared.endEditing()
            }
        }
        .padding(.vertical)
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
#Preview {
    OtpView()
}
