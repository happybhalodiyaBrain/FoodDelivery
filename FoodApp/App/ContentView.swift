import SwiftUI

struct ContentView: View {
    // MARK: - Environment Object
    /// The navigation service used to manage the app's navigation state and logged-in status.
    @EnvironmentObject private var navigationService: NavigationService
    @State private var isSplashActive: Bool = true // State to control splash screen visibility
    // MARK: - Body
    var body: some View {
        // NavigationStack to manage navigation and deep linking with the navigation path.
        NavigationStack(path: $navigationService.navigationPath) {
            // MARK: - Conditional View Rendering
            // If the user is logged in, show the TabsView. Otherwise, show the SplashScreen.
            Group {
                if isSplashActive {
                    SplashScreen() // Show splash screen
                } else {
                    if navigationService.isLoggedIn {
                        TabBarView() // Show tabs if logged in
                    } else {
                        SplashScreen() 
                    }
                }
            }
            
            // MARK: - Navigation Destination
            // Handles navigation to different views based on the `Routes` enum.
            .navigationDestination(for: Routes.self) { route in
                route.destinationView()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
