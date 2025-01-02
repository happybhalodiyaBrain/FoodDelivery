import Foundation
import SwiftUI

// MARK: - FRUITS DATA MODEL

struct OnboardingStep: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
}
