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
            case menuList(title: String)
            case menuDetail
        }
        
    }
}
