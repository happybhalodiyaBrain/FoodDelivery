import Foundation
import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    @Published var isSplashActive: Bool = true
    
    init() {
        startSplashSequence()
    }
    private func startSplashSequence() {
           DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               self.isSplashActive = false
               self.navigatePostSplash()
           }
       }
    
    /// Navigate tp onBording screen
    private func navigatePostSplash() {
        if NavigationService.shared.isLoggedIn {
            NavigationService.shared.push(to: .tabbar(.menu))
        } else {
            NavigationService.shared.push(to: .splash(.onBoarding))
        }
    }
}
