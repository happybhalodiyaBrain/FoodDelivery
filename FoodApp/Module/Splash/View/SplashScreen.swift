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
                Image(AppImages.logo.rawValue)
                    .resizable()
                    .frame(width: 209, height: 195)
                
               
            }
        }
    }
}


#Preview {
    SplashScreen()
}
