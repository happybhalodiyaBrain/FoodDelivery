//
//  OtpInputView.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation
import SwiftUI

struct OtpInputView: View {
    // MARK: - Properties
    @Binding var otpValue: [String]
    
    var body: some View {
        HStack(spacing: 28) {
            ForEach(0..<4, id: \.self) { index in
                TextField("", text: $otpValue[index])
                    .frame(width: 59, height: 56)
                    .font(AppFont.FontStyle.interRegular.font(size: 37))
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .background(Color(UIColor.appLightGrayColor))
                    .cornerRadius(12)
                    .onChange(of: otpValue[index]) { newValue in
                        // Limit input to one character
                        if newValue.count > 1 {
                            otpValue[index] = String(newValue.prefix(1))
                        }
                    }
            }
        }
    }
}
