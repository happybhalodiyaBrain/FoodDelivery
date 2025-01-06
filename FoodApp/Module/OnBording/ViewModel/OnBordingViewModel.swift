import SwiftUI

class OnboardingViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var steps: [OnboardingStep] = [
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
    /// The current index of the displayed onboarding step.
    @Published var currentStepIndex: Int = 0
    
    // MARK: - Methods
    
    /// Advances to the next step in the onboarding flow if there are more steps
    func nextStep() {
        if currentStepIndex < steps.count - 1 {
            currentStepIndex += 1
        }
    }
    /// Checks if the current step is the last step in the onboarding flow.
    func isLastStep() -> Bool {
        return currentStepIndex == steps.count - 1
    }
    /// Navigates to the login main view after the onboarding process is completed.
    func onNavigationToLoginMainView () {
        NavigationService.shared.push(to: .auth(.loginMain))
    }
}
