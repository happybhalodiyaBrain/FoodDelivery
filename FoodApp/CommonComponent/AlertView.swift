import Foundation
import SwiftUI

enum AlertType {
    case emptyError
    case signOut
}

extension View {
    
    func showAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        dismissButton: Alert.Button = .default(Text("OK")),
        alertType: AlertType = .emptyError,
        primaryButton: Alert.Button = .default(Text("OK")),
        secondaryButton: Alert.Button = .default(Text("Cancel")),
        signOutAction: (() -> Void)? = nil
    ) -> some View {
        switch(alertType){
        case .emptyError :
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
        case .signOut :
            self.alert(
                isPresented: isPresented,
                content: {
                    Alert(
                        title: Text(title),
                        message: Text(message),
                        primaryButton: .default(Text("OK"), action: {
                            signOutAction?()
                        }),
                        secondaryButton: secondaryButton
                    )
                }
            )
        }
    }
}
