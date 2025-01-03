import SwiftUI

/// MARK: - TabbarRoutes
extension Routes.TabbarRoutes {
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .home:
            TabsView()
        }
    }
}
