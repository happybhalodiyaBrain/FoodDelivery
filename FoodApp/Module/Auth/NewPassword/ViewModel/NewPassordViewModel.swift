import Foundation
class NewPassordViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// The new password entered by the user.
    @Published var newPassowrd: String = ""
    
    /// The confirm password entered by the user.
    @Published var confirmPassowrd: String = ""
    
    /// Navigate to New password screen 
    func onNavigateToNewPasswordView () {
        NavigationService.shared.popToRoot(push: .auth(.login))
    }
}

