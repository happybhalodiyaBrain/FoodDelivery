
import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class LoginMainViewModel: ObservableObject {
    
    /// Navigates to the Login screen.
    func onNavigateToLoginView () {
        NavigationService.shared.push(to: .auth(.login))
    }
    /// Navigates to the Signup screen.
    func onNavigateToSignupView () {
        NavigationService.shared.push(to: .auth(.signup))
    }
}
