import Foundation
import SwiftUI

// MARK: - OnboardingStep Model
/// A data model representing a single step in the onboarding process.
struct OnboardingStep: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
}
