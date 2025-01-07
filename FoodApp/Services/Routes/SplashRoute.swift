import SwiftUI

/// SplashRouteBuilder
struct SplashRouteBuilder {
    
    // MARK: - Variable(s)
    let routes: Routes.SplashRoutes
    
    // MARK: - ViewBuilder
    @ViewBuilder
    func configure() -> some View {
        switch routes {
        case .splash:
            SplashScreen()
        case .onboarding:
            OnBoardingView()
        }
    }
    
}
