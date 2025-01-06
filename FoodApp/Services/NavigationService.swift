import Foundation

// MARK: - NavigationService
final class NavigationService: ObservableObject {
    /// Shared instance of the `NavigationService` class for global access.
    static let shared = NavigationService()
    
    private init() {}
    
    // MARK: - Published Properties
    
    /// A list representing the current navigation path, storing the sequence of routes.
    @Published var navigationPath: [Routes] = []
    
    /// A boolean indicating whether the user is logged in, based on UserDefaults.
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    
    // MARK: - Login Status Methods
    
    /// Updates the login status and stores it in UserDefaults.
    /// - Parameter isLoggedIn: The new login status.
    func updateLoginStatus(_ isLoggedIn: Bool) {
        guard self.isLoggedIn != isLoggedIn else { return }
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        self.isLoggedIn = isLoggedIn
        popToRoot()
    }
    
    
    // MARK: - Navigation Methods
    
    /// Pushes a new route onto the navigation stack.
    /// - Parameter route: The route to push onto the stack.
    func push(to route: Routes) {
        navigationPath.append(route)
    }
    /// Pops the current route from the navigation stack.
    /// - Parameter route: Optionally specify a route to pop back to.
    func pop(to route: Routes? = nil) {
        if let route = route {
            guard let index = navigationPath.firstIndex(of: route) else { return }
            navigationPath = Array(navigationPath[0...index])
        } else {
            navigationPath.removeLast()
        }
    }
    
    /// Pops a specified number of steps from the navigation stack.
    /// - Parameter step: The number of steps to pop from the stack.
    func pop(to step: Int) {
        guard navigationPath.count > step else { return }
        navigationPath.removeLast(step)
    }
    
    /// Pops all routes from the navigation stack and optionally pushes a new route.
    /// - Parameter route: Optionally specify a route to push after clearing the stack.
    func popToRoot(push route: Routes? = nil) {
        navigationPath.removeAll()
        if let route = route {
            push(to: route)
        }
    }
}
