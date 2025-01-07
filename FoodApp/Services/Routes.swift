//import Foundation
//import SwiftUI
//
//// MARK: - Routes Enum
//enum Routes: Hashable {
//    // MARK: - Main Routes
//    case splash(SplashRoutes)
//    case auth(AuthRoutes)
//    case tabbar(TabbarRoutes)
//
//    // MARK: - Splash Routes
//    enum SplashRoutes: Hashable {
//        case splash
//        case onBoarding
//    }
//
//    // MARK: - Authentication Routes
//    enum AuthRoutes: Hashable {
//        case loginMain
//        case login
//        case signup
//        case resetPassword
//        case verifyOTP
//        case newPassword
//    }
//
//    // MARK: - Tabbar Routes
//    enum TabbarRoutes: Hashable {
//        case menu
//        case offers
//        case home
//        case profile
//        case more
//    }
//
//    // MARK: - Destination View Method
//    @ViewBuilder
//    func destinationView() -> some View {
//        switch self {
//        case .splash(let route):
//            route.destinationView()
//        case .auth(let route):
//            route.destinationView()
//        case .tabbar(let route):
//            route.destinationView()
//        }
//    }
//}

import Foundation

enum Routes: Hashable {
    
    // MARK: - Initial Routes
    case splash(SplashRoutes)
    case auth(AuthRoutes)
    case tabbar(TabbarRoutes)
    
    enum SplashRoutes: Hashable {
        case splash
        case onboarding
    }
    
    // MARK: - Sub-Routes of Auth
    enum AuthRoutes: Hashable {
        case loginMain
        case login
        case signup
        case resetPassword
        case otpView
        case newPassword
    }
    
    // MARK: - Sub-Routes of Dashboard
    enum TabbarRoutes: Hashable {
        case home
        case menu(MenuRoutes)
        case offer
        case profile
        case more
        
        
        // MARK: - Sub-Routes of Menu tab
        enum MenuRoutes: Hashable {
            case menuListview(title: String)
            case menuDetail
        }
        
    }
}
