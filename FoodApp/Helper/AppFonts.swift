import Foundation
import SwiftUI

/// FontStyle enum defines the different font styles available in the app.
struct AppFont {
    
    /// FontStyle enum defines the different font styles available in the app.
    enum FontStyle: String {
        case interBold = "Inter-Bold"
        case interExtrabold = "Inter-ExtraBold"
        case interLight = "Inter-Light"
        case interMedium = "Inter-Medium"
        case interRegular = "Inter-Regular"
        case interSemibold = "Inter-SemiBold"
        
        func font(size: CGFloat) -> Font {
            return .custom(self.rawValue, size: size)
        }
    }
}
