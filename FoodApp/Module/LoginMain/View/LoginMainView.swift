import SwiftUI

struct LoginMainView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    // Top Orange Section with Background
                    ZStack {
                        Image(AppImages.Organetopshape.rawValue)
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                        
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
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.appSecondaryFontColor))
                        
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
                            destination: LoginView(),
                            foregroundColor:Color(UIColor.appWhiteColor)
                        )
                        
                        CustomNavigationButton(
                            title: AppStrings.createAccount,
                            backgroundColor: Color(UIColor.appWhiteColor),
                            destination: SignupView(),
                            foregroundColor:Color(UIColor.appOrangeColor)
                        )
                    }
                    .padding(.top, 20)
                    .padding(.vertical)
                    
                }
                
                
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginMainView()
}

