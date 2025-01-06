import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class OTPViewModel: ObservableObject {
    
    /// Navigates to the New password  screen.
    func onNavigateToNewPasswordView() {
        NavigationService.shared.push(to: .auth(.newPassword))
    }
    
    /// Navigates to the Reset password  screen.
    func onNavigateToResetPasswordView () {
        NavigationService.shared.push(to: .auth(.resetPassword))
    }
}
