import Foundation
class NewPassordViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    /// The new password entered by the user.
    @Published var newPassowrd: String = ""
    
    /// The confirm password entered by the user.
    @Published var confirmPassowrd: String = ""
}

