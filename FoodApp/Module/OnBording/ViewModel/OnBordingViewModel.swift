import SwiftUI

class OnboardingViewModel: ObservableObject {
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
    @Published var currentStepIndex: Int = 0

    func nextStep() {
        if currentStepIndex < steps.count - 1 {
            currentStepIndex += 1
        }
    }

    func isLastStep() -> Bool {
        return currentStepIndex == steps.count - 1
    }
    
    func NavigationToLoginMainView () {
        NavigationService.shared.push(to: .auth(.loginMain))
    }
}
