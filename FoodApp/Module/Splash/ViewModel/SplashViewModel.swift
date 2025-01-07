import Foundation
import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    @Published var isSplashActive: Bool = true
    @Published var showSplash: Bool = true

    init() {
        startSplashSequence()
    }
    private func startSplashSequence() {
           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               self.showSplash = false
               self.navigatePostSplash()
           }
       }
    
    /// Navigate tp onBording screen
    private func navigatePostSplash() {
        print(NavigationService.shared.isLoggedIn)
        if NavigationService.shared.isLoggedIn {
            TabBarView()
        } else {
            NavigationService.shared.push(to: .splash(.onboarding))
        }
    }
}
