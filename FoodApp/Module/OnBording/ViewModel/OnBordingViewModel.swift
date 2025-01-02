import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var steps: [OnboardingStep] = [
        OnboardingStep(image: AppImages.onBording1.rawValue, title: "Find Food You Love", description: "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep."),
        OnboardingStep(image: AppImages.onBording2.rawValue,  title: "Fast Delivery", description: "Fast food delivery to your home, office wherever you are."),
        OnboardingStep(image: AppImages.onBording3.rawValue, title: "Live Tracking", description: "Real-time tracking of your food on the app once you placed the order.")
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
}
