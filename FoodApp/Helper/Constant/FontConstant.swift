
import Foundation
import SwiftUI

var designSize: CGSize = CGSize(width: 375.0, height: 812.0) // size as per figma
var deviceScreenSize: CGSize = CGSize(width: 375.0, height: 812.0) // 15 pro
var geometryHeight = deviceScreenSize.height // Global Height Constant of GeometryReader to use throught App
var geometryWidth = deviceScreenSize.width // Global Width Constant of GeometryReader to use throught App


struct FontConstant {
    static let inter_regular = "Inter-Regular"
}

struct FontSizeManager {
    static func scaledFont(size: CGFloat) -> CGFloat {
        let widthFactor = deviceScreenSize.width / designSize.width
        let heightFactor = deviceScreenSize.height / designSize.height
        let scaleFactor = min(widthFactor, heightFactor) // Maintain aspect ratio
        return max(size * scaleFactor, size * 0.8) // Avoid excessive shrinking
    }
}
