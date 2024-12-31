import SwiftUI

struct SplashScreen: View {
    @StateObject private var viewModel = SplashViewModel()
    
    var body: some View {
        if viewModel.isSplashActive {
            ZStack {
                // Background pattern
                Image(AppImages.splashBG.rawValue)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Center content
                VStack(spacing: 10) {
                    Image(AppImages.monkeyFace.rawValue)
                        .resizable()
                        .frame(width: 103, height: 105)
                    
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
                }
            }
        } else {
            LoginView()
        }
    }
}


#Preview {
    SplashScreen()
}
