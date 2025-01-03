
import Foundation
import SwiftUI

/// ViewModel for handling login functionality and validation logic.
class LoginMainViewModel: ObservableObject {
    
    
    func NavigateToLoginView () {
        NavigationService.shared.push(to: .auth(.login))
    }
    
    func NavigateToSignupView () {
        NavigationService.shared.push(to: .auth(.signup))
    }
}
