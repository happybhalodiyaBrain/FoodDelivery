import SwiftUI

struct LoginMainView: View {
    // MARK: - ViewModel
    @StateObject private var viewModel = LoginMainViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // MARK: - Background Image
                ZStack {
                    Image(AppImages.Organetopshape.rawValue)
                        .resizable()
                        .scaledToFill()
                }.frame(width: geometry.size.width,
                        height: geometry.size.height * 0.50)
                
                
                // MARK: - Main Content
                VStack {
                    // Logo Image
                    Image(AppImages.monkeyFace.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top, geometry.size.height * -0.11) // Adjust top padding for different screen sizes
                    
                    // MARK: - Title
                    HStack {
                        Text(AppStrings.meal)
                            .textStyle(size:34, color: Color(UIColor.appOrangeColor), fontStyle: .interBold)
                        
                        Text(AppStrings.monkey)
                            .textStyle(size: 34, color: Color(UIColor.appDarkGeryColor), fontStyle: .interBold)
                    }
                    
                    
                    // MARK: - Subtitle
                    Text(AppStrings.foodDelivery)
                        .textStyle(size: 10, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                        .tracking(2)
                        .appTopPadding(5)
                    
                    // MARK: - Login Note
                    Text(AppStrings.loginNote)
                        .textStyle(size:13, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                        .appHorizontalPadding(geometry.size.width * 0.10)
                        .appTopPadding(geometry.size.height * 0.02)
                    
                    // MARK: - Action Buttons
                    VStack(spacing: geometry.size.height * 0.03) { // Adjust spacing between buttons
                        // Login Button
                        CustomNavigationButton(
                            title: AppStrings.login,
                            backgroundColor: Color(UIColor.appOrangeColor),
                            foregroundColor: Color(UIColor.appWhiteColor),
                            action: { viewModel.onNavigateToLoginView() }
                        )
                        
                        // Create Account Button
                        CustomNavigationButton(
                            title: AppStrings.createAccount,
                            backgroundColor: Color(UIColor.appWhiteColor),
                            foregroundColor: Color(UIColor.appOrangeColor),
                            action: { viewModel.onNavigateToSignupView() }
                        )
                    }
                    .padding(.top, geometry.size.height * 0.05)
                    
                }
                Spacer()
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LoginMainView()
}
