import SwiftUI

/// Tabbar Route Builder
struct TabbarRouteBuilder {
    
    // MARK: - Variable(s)
    let routes: Routes.TabbarRoutes
    
    // MARK: - ViewBuilder function
    @ViewBuilder
    func configure() -> some View {
        switch routes {
        case .home:
            HomeView()
        case .menu(let menuRoutes):
            MenuRouteBuilder(route: menuRoutes).configure()
        case .offer:
            OffersView()
        case .profile:
            ProfileView()
        case .more:
            MoreView()
        }
    }
}

/// Menu Route Builder
struct MenuRouteBuilder {
    
    // MARK: - Variable(s)
    let route: Routes.TabbarRoutes.MenuRoutes
    
    // MARK: - ViewBuilder function
    @ViewBuilder
    func configure() -> some View {
        switch route {
        case .menuListview(let title):
            Text("hi")
        case .menuDetail:
            Text("hi")
        }
    }
}



