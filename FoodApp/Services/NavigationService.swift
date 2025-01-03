import Foundation

// MARK: - NavigationService
final class NavigationService: ObservableObject {
    static let shared = NavigationService()

    private init() {}

    @Published var navigationPath: [Routes] = []
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")

    func updateLoginStatus(_ isLoggedIn: Bool) {
        guard self.isLoggedIn != isLoggedIn else { return }
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        self.isLoggedIn = isLoggedIn
        popToRoot()
    }

    func push(to route: Routes) {
        navigationPath.append(route)
    }

    func pop(to route: Routes? = nil) {
        if let route = route {
            guard let index = navigationPath.firstIndex(of: route) else { return }
            navigationPath = Array(navigationPath[0...index])
        } else {
            navigationPath.removeLast()
        }
    }

    func pop(to step: Int) {
        guard navigationPath.count > step else { return }
        navigationPath.removeLast(step)
    }

    func popToRoot(push route: Routes? = nil) {
        navigationPath.removeAll()
        if let route = route {
            push(to: route)
        }
    }
}
