//
//  CustomHeaderView.swift
//  FoodApp
//
//  Created by Happy  Bhalodiya on 07/01/25.
//

import Foundation
import SwiftUI

struct CustomHeaderView: View {
    let showBackArrow: Bool
    let greetingText: String
    let onBackTapped: () -> Void

    var body: some View {
        HStack {
            // Back Arrow (conditionally shown)
            if showBackArrow {
                Button(action: onBackTapped) {
                    Image(Icons.back.rawValue)
                        .font(.system(size: 20, weight: .bold))
                        
                }
            }

            // Greeting text
            Text(greetingText)
                .textStyle(size: 20,color: Color(UIColor.appSecondaryFontColor), fontStyle: .interSemibold)

            Spacer()

            // Shopping cart icon
            Button(action: {
                // Handle cart button action here
            }) {
                Image(Icons.cart.rawValue)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.white) // Customize your background color
    }
}
