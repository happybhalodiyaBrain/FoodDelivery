import SwiftUI

struct OnBoardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // MARK: - TabView for onboarding screens
                TabView(selection: $viewModel.currentStepIndex) {
                    ForEach(viewModel.steps.indices, id: \.self) { index in
                        let step = viewModel.steps[index]
                        VStack(spacing: 30) { // Adjust spacing based on screen height
                            // MARK: - Onboarding Image
                            Image(step.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.75,height: geometry.size.height * 0.35)
                            
                            // MARK: - Custom Page Indicator (Dots)
                            HStack(spacing: 8) {
                                ForEach(viewModel.steps.indices, id: \.self) { dotIndex in
                                    Circle()
                                        .fill(dotIndex == viewModel.currentStepIndex ? Color(UIColor.appOrangeColor) : Color(UIColor.appLightGrayColor))
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .appTopPadding(30) // Adjust top padding based on screen size
                            
                            // MARK: - Step Title
                            Text(step.title)
                                .textStyle(size:28, color: Color(UIColor.appDarkGeryColor), fontStyle: .interRegular)
                                .appTopPadding(34) // Adjust padding for title
                            
                            // MARK: - Step Description
                            Text(step.description)
                                .textStyle(size:13, color: Color(UIColor.appSecondaryFontColor), fontStyle: .interRegular)
                                .appHorizontalPadding(52) // Adjust horizontal padding for description
                                .appTopPadding(33) // Adjust padding for description
                            
                            // MARK: - Next Button
                            CustomNavigationButton(
                                title: AppStrings.next,
                                backgroundColor: Color(UIColor.appOrangeColor),
                                foregroundColor: Color(UIColor.appWhiteColor),
                                action: {
                                    viewModel.onNavigationToLoginMainView()
                                }
                            )
                            .appTopPadding(41) // Adjust padding for button
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
}

#Preview {
    OnBoardingView()
}

