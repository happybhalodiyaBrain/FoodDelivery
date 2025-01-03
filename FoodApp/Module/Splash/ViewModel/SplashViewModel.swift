import Foundation
import SwiftUI
import Combine

class SplashViewModel: ObservableObject {
    @Published var isSplashActive: Bool = true

    init() {
        // Simulate some work, such as fetching data or a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.onbording()
        }
    }
    func onbording() {
            NavigationService.shared.push(to: .splash(. onBoarding))
        }
}
