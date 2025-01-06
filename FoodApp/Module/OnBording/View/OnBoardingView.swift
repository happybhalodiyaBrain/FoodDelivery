import SwiftUI


struct OnBoardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
       
            VStack {
                // MARK: - TabView for onboarding screens
                TabView(selection: $viewModel.currentStepIndex) {
                    ForEach(viewModel.steps.indices, id: \.self) { index in
                        let step = viewModel.steps[index]
                        VStack(spacing: 30) {
                            // MARK: - Onboarding Image
                            Image(step.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                            // MARK: - Custom Page Indicator (Dots)
                            HStack(spacing: 8) {
                                ForEach(viewModel.steps.indices, id: \.self) { dotIndex in
                                    Circle()
                                        .fill(dotIndex == viewModel.currentStepIndex ? Color(UIColor.appOrangeColor) : Color(UIColor.appLightGrayColor))
                                        .frame(width: 10, height: 10)
                                }
                            }.appTopPadding(30)
                            // MARK: - Step Title
                            Text(step.title)
                                .textStyle(size: 28, color: Color(UIColor.appDarkGeryColor), fontStyle: .interRegular)
                                .appTopPadding(34)
                            // MARK: - Step Description
                            Text(step.description)
                                .textStyle(size: 13, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                                .appHorizontalPadding(52)
                                .appTopPadding(33)
                            
                            CustomNavigationButton(
                                title: AppStrings.next,
                                backgroundColor: Color(UIColor.appOrangeColor),
                                foregroundColor: Color(UIColor.appWhiteColor),
                                action: {
                                    viewModel.onNavigationToLoginMainView()
                                }
                            )
                            .appTopPadding(41)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    
}


#Preview {
    OnBoardingView()
}

