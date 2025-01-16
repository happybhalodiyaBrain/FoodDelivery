//
//  ProfileViewModel.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 15/01/25.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    // MARK: - Published Properties for User Input
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var mobile: String = ""
    @Published var address: String = ""
    @Published var pincode: String = ""
    @Published var city: String = ""
    
    // MARK: - Published Properties for Alert
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertTitle: String = ""
    @Published var isSignOutAlert: Bool = false
    
    /// Validates the user inputs and triggers completion if valid.
    /// - Parameter completion: The closure to be executed upon successful validation.
    func validateInputs(completion: @escaping () -> Void) {
        if ValidationUtils.isEmpty(name) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.nameError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(email){
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.emptyEmailError, alertType: .emptyError)
        } else if !ValidationUtils.isValidEmail(email) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.emailError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(mobile) || mobile.count < 10 {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.mobileError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(address) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.addressError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(city) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.cityError, alertType: .emptyError)
        } else if ValidationUtils.isEmpty(pincode) {
            showAlert(title: AppStrings.ErrorMessages.validationError, message: AppStrings.ErrorMessages.pincodeError, alertType: .emptyError)
        } else {
            completion()
        }
    }
    
    private func showAlert(title: String, message: String, alertType: AlertType = .emptyError) {
        alertTitle = title
        alertMessage = message
        showAlert = true
        self.isSignOutAlert = alertType == .signOut
    }
    /// Triggers the sign-out confirmation alert.
    func showSignOutAlert() {
        isSignOutAlert = true
        showAlert(title: "Sign Out", message: "Are you sure you want to sign out?", alertType: .signOut)
    }
    
    
    // MARK: - Sign Out
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
        NavigationService.shared.popToRoot(push: .auth(.login))
    }
    
}
