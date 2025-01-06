import SwiftUI

/// MARK: - TabbarRoutes
extension Routes.TabbarRoutes {
    /// Returns the appropriate view based on the tab bar route.
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .home:
            TabsView()
        }
    }
}
