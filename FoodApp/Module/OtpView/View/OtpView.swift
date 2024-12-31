import SwiftUI

struct OtpView: View {
    
    @State private var otp: [String] = Array(repeating: "", count: 4)
    
    var body: some View {
        NavigationView{
            VStack(spacing: 35){
                VStack(spacing: 10) {
                    Text(AppStrings.otpTitle).appTitleStyle()
                    Text(AppStrings.otpNote).appSubtitleStyle()
                }
                .appHorizontalPadding(50)
                
                // OTP Input Fields
                HStack(spacing: 28) {
                    ForEach(0..<otp.count, id: \.self) { index in
                        TextField("*", text: Binding(
                            get: { otp[index] },
                            set: { newValue in
                                otp[index] = String(newValue.prefix(1)) // Allow only 1 character
                            }
                        ))
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(width: 56, height: 56)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                }.padding(.top, 34)
                
                NavigationLink(destination: NewPasswordView()) {
                    Text(AppStrings.next)
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .foregroundColor(Color(UIColor.appWhiteColor))
                        .background(Color(UIColor.appOrangeColor))
                        .cornerRadius(28)
                }
                .appHorizontalPadding(34)
                
                HStack {
                    Text(AppStrings.DidntReceive)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.gray)

                    Button(action: {
                        // Handle sign-up navigation action
                    }) {
                        NavigationLink(destination: ResetPassView()) {
                            Text(AppStrings.clickHere)
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.orange)
                        }
                    }
                }
                Spacer()
                
            }
      
        }
        .padding(.vertical)
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

#Preview {
    OtpView()
}
