import Foundation
import SwiftUI

// MARK: - Routes Enum
enum Routes: Hashable {
    // MARK: - Main Routes
    case splash(SplashRoutes)
    case auth(AuthRoutes)
    case tabbar(TabbarRoutes)

    // MARK: - Splash Routes
    enum SplashRoutes: Hashable {
        case splash
        case onBoarding
    }

    // MARK: - Authentication Routes
    enum AuthRoutes: Hashable {
        case loginMain
        case login
        case signup
        case resetPassword
        case verifyOTP
        case newPassword
    }

    // MARK: - Tabbar Routes
    enum TabbarRoutes: Hashable {
        case home
    }

    // MARK: - Destination View Method
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .splash(let route):
            route.destinationView()
        case .auth(let route):
            route.destinationView()
        case .tabbar(let route):
            route.destinationView()
        }
    }
}
