import Foundation
import SwiftUI


/// A reusable view that displays a section with a header, an optional "View All" button, and custom content.
struct SectionWithHeader<Content: View>: View {
    
    // MARK: - Properties
    let title: String
    let showViewAll: Bool
    let content: Content
    
    /// Initializes the `SectionWithHeader` view.
    /// - Parameters:
    ///   - title: The title of the section.
    ///   - showViewAll: Whether the "View All" button should be shown.
    ///   - content: A closure that defines the custom content to display in the section.
    init(title: String, showViewAll: Bool, @ViewBuilder content: () -> Content) {
        self.title = title
        self.showViewAll = showViewAll
        self.content = content()
    }
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            // Header Section
            HStack {
                // Section Title
                Text(title)
                    .textStyle(size: 20, color: Color(UIColor.appDarkGeryColor), fontStyle: .interSemibold)
                
                Spacer()
                // Optional "View All" Button
                if showViewAll {
                    Button(action: {
                        print("\(title) View All tapped")
                    }) {
                        Text(AppStrings.viewAll)
                            .textStyle(size: 13, color: Color(UIColor.appOrangeColor), fontStyle: .interSemibold)
                    }
                }
            }
            .padding(.horizontal, 17)
            .padding(.bottom, 33)
            // Custom Content
            content
        }.appTopPadding(44)
    }
}
