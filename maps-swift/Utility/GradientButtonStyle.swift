//
//  GradientButtonStyle.swift
//  maps-swift
//
//  Created by Icaro on 20/08/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration:Configuration) -> some View {
        configuration
            .label
                .padding(.vertical)
                .padding(.horizontal, 30)
                .background(
                    // Conditional Statement with Nil Coalescing
                    // Condition ? true : false
                    configuration.isPressed ?
                    LinearGradient(
                        colors: [.customGrayMedium, .customGrayLight],
                        startPoint: .top,
                        endPoint: .bottom
                    ) :
                        LinearGradient(
                            colors: [.customGrayLight, .customGrayMedium],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    // A: When user pressed button
                    // A: When the button is not pressed
                    
                   
                )
                .cornerRadius(40)
    }
}
