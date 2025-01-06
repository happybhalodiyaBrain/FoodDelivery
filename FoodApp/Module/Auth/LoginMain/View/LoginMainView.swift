import SwiftUI

struct LoginMainView: View {
    // MARK: - ViewModel
    /// ViewModel for handling login and signup navigation logic.
    @StateObject private var viewModel = LoginMainViewModel()
    
    var body: some View {
        VStack{
            // MARK: - Background Image
            ZStack{
                Image(AppImages.Organetopshape.rawValue)
                    .resizable()
                    .scaledToFit()
            }
            // MARK: - Main Content
            VStack {
                /// Logo Image
                Image(AppImages.monkeyFace.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, -150)
                // MARK: - Title
                HStack {
                    Text(AppStrings.meal)
                        .textStyle(size: 34, color: Color(UIColor.appOrangeColor), fontStyle: .interBold)
                    
                    Text(AppStrings.monkey)
                        .textStyle(size: 34, color: Color(UIColor.appDarkGeryColor), fontStyle: .interBold)
                }.padding(.top, -15)
                // MARK: - Subtitle
                Text(AppStrings.foodDelivery)
                    .textStyle(size: 10, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                    .tracking(2)
                    .appTopPadding(5)
                // MARK: - Login Note
                Text(AppStrings.loginNote)
                    .textStyle(size: 13, color: Color(UIColor.appSecondaryFontColor),
                               fontStyle: .interRegular)
                    .appHorizontalPadding(52)
                    .appTopPadding(33)
                
                // MARK: - Action Buttons
                VStack(spacing: 20) {
                    // Login Button
                    CustomNavigationButton(
                        title: AppStrings.login,
                        backgroundColor: Color(UIColor.appOrangeColor),
                        foregroundColor:Color(UIColor.appWhiteColor),
                        action: { viewModel.onNavigateToLoginView()}
                    )
                    // Create Account Button
                    CustomNavigationButton(
                        title: AppStrings.createAccount,
                        backgroundColor: Color(UIColor.appWhiteColor),
                        foregroundColor:Color(UIColor.appOrangeColor),
                        action: { viewModel.onNavigateToSignupView()}
                    )
                }
                .padding(.top, 37)
                
            }
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginMainView()
}

