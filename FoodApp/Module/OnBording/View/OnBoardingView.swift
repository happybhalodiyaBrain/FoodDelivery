import SwiftUI


struct OnBoardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // TabView for onboarding screens
                TabView(selection: $viewModel.currentStepIndex) {
                    ForEach(viewModel.steps.indices, id: \.self) { index in
                        let step = viewModel.steps[index]
                        VStack(spacing: 30) {
                            Image(step.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                            // Custom Page Indicator (Dots)
                            HStack(spacing: 8) {
                                ForEach(viewModel.steps.indices, id: \.self) { dotIndex in
                                    Circle()
                                        .fill(dotIndex == viewModel.currentStepIndex ? Color(UIColor.appOrangeColor) : Color(UIColor.appLightGrayColor))
                                        .frame(width: 10, height: 10)
                                }
                            }.appTopPadding(30)
                            
                            Text(step.title)
                                .font(AppFont.FontStyle.interRegular.font(size: 28))
                                .foregroundColor(Color(UIColor.appDarkGeryColor))
                                .appTopPadding(34)
                            Text(step.description)
                                .font(AppFont.FontStyle.interRegular.font(size: 13))
                                .foregroundColor(Color(UIColor.appSecondaryFontColor))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 52)
                                .padding(.top, 33)
                            
                            CustomNavigationButton(
                                title: AppStrings.next,
                                backgroundColor: Color(UIColor.appOrangeColor),
                                foregroundColor: Color(UIColor.appWhiteColor),
                                action: {
                                    viewModel.NavigationToLoginMainView()
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
}


#Preview {
    OnBoardingView()
}

