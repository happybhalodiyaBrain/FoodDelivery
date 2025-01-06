import SwiftUI

@main
struct FoodAppApp: App {
    // MARK: - Properties
    @StateObject private var navigationManager = NavigationService.shared

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            // ContentView is the main view of the app.
            ContentView()
                .environmentObject(navigationManager)
        }
    }
}
