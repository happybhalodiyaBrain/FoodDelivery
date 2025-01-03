import Foundation
import SwiftUI

struct CustomNavigationButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(AppFont.FontStyle.interRegular.font(size: 16))
                .frame(maxWidth: .infinity, minHeight: 56)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color(UIColor.appOrangeColor), lineWidth: 1)
                )
                .cornerRadius(28)
                .padding(.horizontal, 34)
        }
    }
}

