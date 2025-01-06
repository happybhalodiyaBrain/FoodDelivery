import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class ResetPassViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// The email entered by the user.
    @Published var email: String = ""
    
    /// Navigate to otp view
    func onNavigateToOtpView() {
        NavigationService.shared.push(to: .auth(.verifyOTP))
    }
}
