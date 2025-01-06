import SwiftUI

struct SplashScreen: View {
    
    @StateObject private var viewModel = SplashViewModel()
    
    var body: some View {
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
                        .textStyle(size: 34, color: Color(UIColor.appOrangeColor), fontStyle: .interBold)
                    Text(AppStrings.monkey)
                        .textStyle(size: 34, color: Color(UIColor.appDarkGeryColor), fontStyle: .interBold)
                }
                Text(AppStrings.foodDelivery)
                    .textStyle(size: 10, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                    .tracking(2)
            }
        }
    }
}


#Preview {
    SplashScreen()
}
