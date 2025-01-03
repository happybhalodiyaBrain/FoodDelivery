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
                        VStack(spacing: 20) {
                            Image(step.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 300)
                            // Custom Page Indicator (Dots)
                            HStack(spacing: 8) {
                                ForEach(viewModel.steps.indices, id: \.self) { dotIndex in
                                    Circle()
                                        .fill(dotIndex == viewModel.currentStepIndex ? Color.orange : Color.gray)
                                        .frame(width: 10, height: 10)
                                }
                            }
                            .padding(.vertical, 16)
                            Text(step.title)
                                .font(.system(size: 28, weight: .regular))
                                .foregroundColor(Color(UIColor.appDarkGeryColor))
                            Text(step.description)
                                .font(.system(size: 13, weight: .regular))
                                .foregroundColor(Color(UIColor.appSecondaryFontColor))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                                .padding(.top, 15)
                            
                            CustomNavigationButton(
                                title: AppStrings.next,
                                backgroundColor: Color(UIColor.appOrangeColor),
                                foregroundColor: Color(UIColor.appWhiteColor),
                                action: {
                                    viewModel.NavigationToLoginMainView()
                                }
                            )
                            .padding(.top, 41)
                        }
                        .tag(index) // Ensure the tag matches the type of `selection`
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

