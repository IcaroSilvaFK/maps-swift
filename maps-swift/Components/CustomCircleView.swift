//
//  CustomCircleView.swift
//  maps-swift
//
//  Created by Icaro on 20/08/23.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimateGradient = false
    
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .bottom,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear{
                    withAnimation(
                        .linear(duration: 3.0)
                        .repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                    
                }
                MotionAnimationView()
        }//ZStack
        .frame(width: 256, height: 256)
        
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
