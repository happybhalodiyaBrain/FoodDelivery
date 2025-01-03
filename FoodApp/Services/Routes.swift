import Foundation
import SwiftUI

enum Routes: Hashable {
    case splash(SplashRoutes)
    case auth(AuthRoutes)
    case tabbar(TabbarRoutes)

    enum SplashRoutes: Hashable {
        case splash
        case onBoarding
    }

    enum AuthRoutes: Hashable {
        case loginMain
        case login
        case signup
        case resetPassword
        case verifyOTP
        case newPassword
    }

    enum TabbarRoutes: Hashable {
        case home
    }

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
