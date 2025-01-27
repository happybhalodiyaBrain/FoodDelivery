
import SwiftUI

// OnboardingView
struct OnBoardingView: View {
    
    @StateObject private var viewModel = OnboardingViewModel()

   
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                /// TabView for pagination and displaying different onboarding screens
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(viewModel.steps, id: \.id) { item in
                        VStack {
                            // Image
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.75,height: geometry.size.height * 0.35)
                                .padding()
                                .transition(.opacity)
                        }
                        .padding()
                        .tag(viewModel.steps.firstIndex { $0.id == item.id } ?? 0)
                    }
                }
                .tabViewStyle(.page)
                .padding(.vertical, 10)
                .onAppear {
                    setupAppearance()
                }
            
                /// Title for the selected onboarding screen
                Text(viewModel.currentStep.title)
                    .textStyle(size: 28, color: Color(UIColor.appDarkGeryColor),
                               fontStyle: .interRegular)
                    .appTopPadding(34)
                  
                
                /// Description text for the selected onboarding screen
                Text(viewModel.currentStep.description)
                    .multilineTextAlignment(.center)
                    .frame(height: geometry.size.height * 0.08)
                    .textStyle(size: 13, color: Color(UIColor.appSecondaryFontColor),
                               fontStyle: .interRegular)
                    .appTopPadding(33)
                    .lineSpacing(3)
                    .padding(.horizontal, 52)
                
                CustomNavigationButton(
                    title: AppStrings.next,
                    backgroundColor: Color(UIColor.appOrangeColor),
                    foregroundColor: Color(UIColor.appWhiteColor),
                    action: {
                        viewModel.onNextButtonTapped()
                    }
                ).padding(.top, geometry.size.height * 0.05)
                    .padding(.bottom, geometry.size.height * 0.08)
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    /// Setup the appearance of the page control indicators for the TabView.
    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .appOrange
        UIPageControl.appearance().pageIndicatorTintColor = .appLightGray
    }
}

#Preview {
    OnBoardingView()
}
