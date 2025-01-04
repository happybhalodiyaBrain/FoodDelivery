import Foundation
import SwiftUI

extension View {
    /// A reusable alert function to show alerts in SwiftUI.
    /// - Parameters:
    ///   - isPresented: A binding that determines whether the alert is shown.
    ///   - title: The title of the alert.
    ///   - message: The message displayed in the alert.
    ///   - dismissButton: The dismiss button for the alert (default is "OK").
    /// - Returns: A view with the alert applied.
    func showAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        dismissButton: Alert.Button = .default(Text("OK"))
    ) -> some View {
        self.alert(
            isPresented: isPresented,
            content: {
                Alert(
                    title: Text(title),
                    message: Text(message),
                    dismissButton: dismissButton
                )
            }
        )
    }
}
