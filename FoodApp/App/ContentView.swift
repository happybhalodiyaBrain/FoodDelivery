import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var navigationService: NavigationService
    
    var body: some View {
        NavigationStack(path: $navigationService.navigationPath) {
            Group {
                if navigationService.isLoggedIn {
                    TabsView()
                    
                } else {
                    SplashScreen()
                }
            }
            .navigationDestination(for: Routes.self) { route in
                route.destinationView()
            }
        }
    }
}

#Preview {
    ContentView()
}
