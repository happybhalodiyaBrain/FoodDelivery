import SwiftUI

struct ContentView: View {
    
    // MARK: - Wrapper variable(s)
    @StateObject private var navigationService: NavigationService = NavigationService.shared
    @StateObject private var splashViewModel = SplashViewModel()

    var body: some View {
            ZStack {
                if splashViewModel.showSplash {
                    SplashScreen() // Always show splash first
                } else {
                    NavigationStack(path: $navigationService.navigationPath) {
                        Group {
                            if navigationService.isLoggedIn {
                                TabBarView()
                            } else {
                                SplashScreen() // Redirect to Onboarding
                            }
                        }
                        .navigationDestination(for: Routes.self) { route in
                            switch route {
                            case .splash(let splashRoute):
                                SplashRouteBuilder(routes: splashRoute).configure()
                            case .auth(let authRoute):
                                AuthRouteBuilder(routes: authRoute).configure()
                            case .tabbar(let tabbarRoute):
                                TabbarRouteBuilder(routes: tabbarRoute).configure()
                            }
                        }
                    }
                    .environmentObject(navigationService)
                }
            }
        }
    }


#Preview {
    ContentView()
}
