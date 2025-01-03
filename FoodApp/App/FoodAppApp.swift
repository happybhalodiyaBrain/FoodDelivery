import SwiftUI

@main
struct FoodAppApp: App {
    @StateObject private var navigationManager = NavigationService.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationManager)
        }
    }
}
