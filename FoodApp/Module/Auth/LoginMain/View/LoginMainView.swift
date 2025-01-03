import SwiftUI

struct LoginMainView: View {
   
    @StateObject private var viewModel = LoginMainViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false){
                VStack {
                    ZStack {
                        Image(AppImages.Organetopshape.rawValue)
                            .resizable()
                            .scaledToFit()
                        
                        VStack {
                            Image(AppImages.monkeyFace.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .padding(.top, 300)
                        }
                    }
                    .ignoresSafeArea()
                    // App Information
                    VStack(spacing: 10) {
                        HStack {
                            Text(AppStrings.meal)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(UIColor.appOrangeColor))
                            Text(AppStrings.monkey)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color(UIColor.appDarkGeryColor))
                        }
                        
                        Text(AppStrings.foodDelivery)
                            .foregroundColor(Color(UIColor.appSecondaryFontColor))
                            .font(AppFont.FontStyle.interRegular.font(size: 10))
                        
                        
                        Text(AppStrings.loginNote)
                            .font(.subheadline)
                            .foregroundColor(Color(UIColor.appSecondaryFontColor))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                            .padding(.top, 25)
                    }
                    .padding(.top, -20)
                    
                    Spacer()
                    
                    // Buttons
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
                    .padding(.top, 20)
                    .padding(.vertical)
                    
                }
                
                
            }
            .ignoresSafeArea()
            
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginMainView()
}

