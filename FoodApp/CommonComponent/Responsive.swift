import SwiftUI

struct ResponsivePadding {
    /// Dynamic Horizontal Padding
    static func horizontal(_ value: CGFloat, screenWidth: CGFloat) -> CGFloat {
        return screenWidth * (value / screenWidth)
    }

    /// Dynamic Vertical Padding
    static func vertical(_ value: CGFloat, screenHeight: CGFloat) -> CGFloat {
        return screenHeight * (value / screenHeight)
    }

    /// Dynamic Width
    static func width(_ value: CGFloat, screenWidth: CGFloat) -> CGFloat {
        return screenWidth * (value / screenWidth) 
        /// 375 - 305 - figma
        /// 320 - device
    }

    /// Dynamic Height
    static func height(_ value: CGFloat, screenHeight: CGFloat) -> CGFloat {
        return screenHeight * (value / screenHeight)
    }

    /// Dynamic Top Padding
    static func top(_ value: CGFloat, screenHeight: CGFloat) -> CGFloat {
        return screenHeight * (value / screenHeight)
    }

    /// Dynamic Bottom Padding
    static func bottom(_ value: CGFloat, screenHeight: CGFloat) -> CGFloat {
        return screenHeight * (value / screenHeight)
    }
    
    /// Dynamic Spacing
    static func spacing(_ value: CGFloat, screenWidth: CGFloat) -> CGFloat {
           return screenWidth * (value / screenWidth)
       }
}
