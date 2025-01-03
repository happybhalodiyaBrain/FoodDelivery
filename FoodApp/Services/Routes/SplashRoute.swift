import SwiftUI

// MARK: - SplashRoutes
extension Routes.SplashRoutes {
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .splash:
            SplashScreen()
        case .onBoarding:
            OnBoardingView()
        }
    }
}
