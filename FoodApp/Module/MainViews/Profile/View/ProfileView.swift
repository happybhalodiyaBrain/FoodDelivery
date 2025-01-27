import SwiftUI

// MARK: - ProfileView
struct ProfileView: View {
    
    // ViewModel to handle profile data and logic
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            // Custom Header with greeting text and optional back arrow
            CustomHeaderView(
                showBackArrow: false,
                greetingText: AppStrings.title.profileTitle,
                onBackTapped: {
                }
            )
            ScrollView{
                VStack {
                    // MARK: - Profile Image Section
                    ZStack {
                        // Display the user's profile image (Replace with dynamic data)
                        Image(profile.dummyProfile.rawValue) // Replace with your image name
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 102, height: 102) // Set desired size
                        // Camera icon for editing profile picture
                        VStack {
                            Spacer()
                            Image(systemName: Icons.camerafill.rawValue)
                                .frame(width: 15, height: 12)
                                .foregroundColor(Color(UIColor.appWhiteColor))
                                .padding(.bottom, 8) // Position near the bottom
                        }
                        // Gradient overlay to create a subtle fading effect
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.8)]),
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 102, height: 102)
                    }
                    // Edit Profile Button
                    Button(action: {
                        
                    }) {
                        HStack {
                            Image(Icons.edit.rawValue)
                                .frame(width: 10, height: 10)
                            Text(AppStrings.editProfile)
                                .textStyle(size: 10,
                                           color: Color(UIColor.appOrangeColor),
                                           fontStyle: .interBold)
                        }
                    }.appTopPadding(19)
                    
                    
                    Text(AppStrings.hithereEmilia)
                        .textStyle(size: 16,
                                   color: Color(UIColor.appDarkGeryColor),
                                   fontStyle: .interRegular)
                    
                        .appTopPadding(13)
                    
                    // Sign Out Button
                    Button(action: {
                        viewModel.showSignOutAlert()
                    }) {
                        Text(AppStrings.signOut)
                            .textStyle(size: 11,
                                       color: Color(UIColor.appSecondaryFontColor),
                                       fontStyle: .interRegular)
                        
                    }.appTopPadding(6)
                }
                // MARK: - Profile Information Fields
                VStack(spacing: 17) {
                    // Custom Text Fields for profile data input
                    CustomTextField(placeholder: AppStrings.name, text: $viewModel.name)
                    CustomTextField(placeholder: AppStrings.email, text: $viewModel.email, keyboardType: .emailAddress)
                    CustomTextField(placeholder: AppStrings.mobile, text: $viewModel.mobile,keyboardType: .numberPad)
                    CustomTextField(placeholder: AppStrings.address, text: $viewModel.address)
                    CustomTextField(placeholder: AppStrings.city, text: $viewModel.city)
                    CustomTextField(placeholder: AppStrings.pincode, text: $viewModel.pincode, keyboardType: .numberPad)
                }.appTopPadding(48)
                //MARK: - Save up Button
                CustomNavigationButton(
                    title: AppStrings.save,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor:Color(UIColor.appWhiteColor),
                    action: { viewModel.validateInputs {
                        print("Save profile successful!")
                    }}
                ).appTopPadding(17)
                    .padding(.bottom, 34)
            }
        }
        // MARK: - Show Alert
        // Display an alert if the `showAlert` flag is set in the ViewModel
        .showAlert(
            isPresented: $viewModel.showAlert,
            title: viewModel.alertTitle,
            message: viewModel.alertMessage,
            alertType: viewModel.isSignOutAlert ? .signOut : .emptyError,
            signOutAction: {
                viewModel.signOut() 
            }
        )
        
    }
}

#Preview {
    ProfileView()
}
