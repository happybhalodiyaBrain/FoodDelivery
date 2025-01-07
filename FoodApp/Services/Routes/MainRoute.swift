import SwiftUI

/// MARK: - TabbarRoutes
extension Routes.TabbarRoutes {
    /// Returns the appropriate view based on the tab bar route.
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .menu:
            MenuView()
        case .offers:
            OffersView()
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        case .more:
            MoreView()
        }
    }
}
