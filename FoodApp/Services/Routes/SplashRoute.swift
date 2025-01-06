import SwiftUI

// MARK: - SplashRoutes
extension Routes.SplashRoutes {
    /// Returns the appropriate view based on the splash route.
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .splash:
            // Returns the SplashScreen for the splash screen route
            SplashScreen()
        case .onBoarding:
            // Returns the OnBoardingView for the onboarding screen route
            OnBoardingView()
        }
    }
}
