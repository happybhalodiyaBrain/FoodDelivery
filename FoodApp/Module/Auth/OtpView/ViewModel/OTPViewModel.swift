import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class OTPViewModel: ObservableObject {
    func NavigateToNewPasswordView() {
        NavigationService.shared.push(to: .auth(.newPassword))

    }
    func NavigateToResetPasswordView () {
        NavigationService.shared.push(to: .auth(.resetPassword))
    }
}
