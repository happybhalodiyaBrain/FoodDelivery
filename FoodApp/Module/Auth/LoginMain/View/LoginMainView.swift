import SwiftUI

struct LoginMainView: View {
    
    @StateObject private var viewModel = LoginMainViewModel()
    
    var body: some View {
        VStack{
            ZStack{
                Image(AppImages.Organetopshape.rawValue)
                    .resizable()
                    .scaledToFit()
            }
            VStack {
                Image(AppImages.monkeyFace.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, -150)
                
                HStack {
                    Text(AppStrings.meal)
                        .font(AppFont.FontStyle.interBold.font(size: 34))
                        .foregroundColor(Color(UIColor.appOrangeColor))
                    Text(AppStrings.monkey)
                        .font(AppFont.FontStyle.interBold.font(size: 34))
                        .foregroundColor(Color(UIColor.appDarkGeryColor))
                }.padding(.top, -15)
                
                Text(AppStrings.foodDelivery)
                    .foregroundColor(Color(UIColor.appSecondaryFontColor))
                    .font(AppFont.FontStyle.interRegular.font(size: 10))
                    .tracking(2)
                    .appTopPadding(5)
                
                Text(AppStrings.loginNote)
                    .font(AppFont.FontStyle.interRegular.font(size: 13))
                    .foregroundColor(Color(UIColor.appSecondaryFontColor))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 52)
                    .padding(.top, 33)
                
                VStack(spacing: 20) {
                    CustomNavigationButton(
                        title: AppStrings.login,
                        backgroundColor: Color(UIColor.appOrangeColor),
                        foregroundColor:Color(UIColor.appWhiteColor),
                        action: { viewModel.NavigateToLoginView()}
                    )
                    
                    CustomNavigationButton(
                        title: AppStrings.createAccount,
                        backgroundColor: Color(UIColor.appWhiteColor),
                        foregroundColor:Color(UIColor.appOrangeColor),
                        action: { viewModel.NavigateToSignupView()}
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

