import SwiftUI

class OnboardingViewModel: ObservableObject {
    @EnvironmentObject private var navigationService: NavigationService
    @Published var currentIndex: Int = 0
    // MARK: - Published Properties
     let steps: [OnboardingStep] = [
        OnboardingStep(image: AppImages.onBording1.rawValue,
                       title: AppStrings.OnBording.onbordingTitle1,
                       description: AppStrings.OnBording.onbordingSubTitle1),
        
        OnboardingStep(image: AppImages.onBording2.rawValue,
                       title: AppStrings.OnBording.onbordingTitle2,
                       description: AppStrings.OnBording.onbordingSubTitle2),
        
        OnboardingStep(image: AppImages.onBording3.rawValue,
                       title:AppStrings.OnBording.onbordingTitle3,
                       description: AppStrings.OnBording.onbordingSubTitle3)
    ]
    
    var currentStep: OnboardingStep {
           return steps[currentIndex]
       }
    // Function to navigate to the login screen when the last step is reached
       func onNextButtonTapped() {
           if currentIndex == steps.count - 1 {
               onNavigationToLoginMainView()
           } else {
               currentIndex += 1
           }
       }
    
    /// Navigates to the login main view after the onboarding process is completed.
    func onNavigationToLoginMainView () {
        NavigationService.shared.push(to: .auth(.loginMain))
    }
}
