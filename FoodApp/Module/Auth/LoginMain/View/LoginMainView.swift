import SwiftUI
import Foundation

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
                        height: geometry.size.height / 2)
                
                
                // MARK: - Main Content
           
                    // Logo Image
                    Image(AppImages.logo.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.3)
                        .padding(.top, -(geometry.size.height * 0.13))
                    
                    
                    
                    // MARK: - Login Note
                    
                    Text(AppStrings.loginNote)
                        .textStyle(size: FontSizeManager.scaledFont(size: 13), color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                        .padding(.horizontal, geometry.size.width * 0.1)
                        .multilineTextAlignment(.center)
                        .lineSpacing(2)
                        .padding(.top, geometry.size.height * 0.02)
                    
                    
                    
                    // MARK: - Action Buttons
                    VStack(spacing: geometry.size.height * 0.025) { // Adjust spacing between buttons
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
                    .padding(.top, geometry.size.height * 0.04)

            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LoginMainView()
}
